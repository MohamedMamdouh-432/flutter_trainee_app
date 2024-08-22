import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trainee/utils/constants.dart';

class FirebaseController extends GetxController {
  String verificationCode = '';
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseStorage = FirebaseStorage.instance.ref();
  final _firebaseStore = FirebaseFirestore.instance;
  final _firebaseMessaging = FirebaseMessaging.instance;

//* firebase auth functions
  Future<void> signInUser() async {
    final phoneCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode, smsCode: otp);
    _firebaseAuth
        .signInWithCredential(phoneCredential)
        .then((credential) => log('User Credential: $credential'))
        .catchError((error) => log(error.toString()));
  }

  Future<void> verifyPhone() async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) async => await signInUser(),
      verificationFailed: (error) => log(error.code),
      codeSent: (verificationId, forceResendingToken) {
        verificationCode = verificationId;
        update();
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  Future<void> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((credential) => log('User Credential: $credential'))
        .catchError((error) => log(error.toString()));
  }

  Future<void> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential)
        .then((credential) => log('User Credential: $credential'))
        .catchError((error) => log(error.toString()));
  }

//* firebase firestore functions
  Future<void> addUserData() async {
    await _firebaseStore.collection('users').add({
      'name': 'Abdul Rehman',
      'age': 23,
    });
  }

//* firebase storage functions
  Future<void> uploadFile(File file, String bucket) async {
    final imagesRef =
        _firebaseStorage.child('$bucket/${file.path.split('/').last}');
    await imagesRef.putFile(file);
    final uploadedUrl = await imagesRef.getDownloadURL();
    log('Uploaded URL: $uploadedUrl');
  }

  Future<String> downloadFile(String path) async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File('$appDir/${path.split('/').last}');
    await _firebaseStorage.child(path).writeToFile(file);
    log('downloading finished');
    return file.path;
  }

  Future<void> listAllFiles(String path) async {
    final resultList = await _firebaseStorage.child(path).list();
    for (var item in resultList.items) {
      log('${item.name} ${item.parent!.name}');
    }
  }

//* firebase messaging functions
  Future<void> getToken() async {
    String? fcmToken = await _firebaseMessaging.getToken();
    log(fcmToken!);
  }

  Future<void> requestMessagingPermissions() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  Future<void> initializeNotifications(BuildContext context) async {
    _firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        log('Message: $message');
      } else {
        log('No Message Sent yet ...');
      }
    });

    FirebaseMessaging.onMessage.listen((message) {
      log('Message: $message');

      AwesomeDialog(
        context: context,
        title: message.notification!.title,
        body: Text(message.notification!.body!),
      ).show();
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('Message: $message');
    });
  }

  Future<void> sendNotification({
    required String title,
    required String body,
  }) async {
    const String serverToken = '';
    await Dio(BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
    )).post(
      'https://fcm.googleapis.com/fcm/send',
      data: {
        'notification': {
          'title': title,
          'body': body,
        },
        'priority': 'high',
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'type': 'text',
          'content': 'Hi Broo! How are you today?',
        },
        'to': await _firebaseMessaging.getToken(),
      },
    );
  }
}
