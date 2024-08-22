import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trainee/animations/animation_screens.dart';
import 'package:trainee/controllers/controllers.dart';
import 'package:trainee/firebase_options.dart';
import 'package:trainee/utils/localization/localizations.dart';
import 'package:trainee/utils/theme/themes.dart';
import 'package:trainee/view/animation_view.dart';
import 'package:trainee/view/views.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TraineeApp());
}

class TraineeApp extends StatelessWidget {
  const TraineeApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppLocaleController());
    Get.put(AppThemeController());
    Get.put(FirebaseController());
    Get.put(MapController());
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(320, 690),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale('en', 'US'),
        translations: AppLocale(),
        theme: ThemeData.dark(),
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => Home()),
          GetPage(name: '/map', page: () => const MapView()),
          GetPage(name: '/storage', page: () => const StorageView()),
          GetPage(name: '/auth', page: () => const AuthenticationView()),
          GetPage(name: '/localization', page: () => const LocalizationView()),
          GetPage(name: '/animation', page: () => const AnimationView()),
          GetPage(name: '/align', page: () => const AnimatedAlignScreen()),
          GetPage(name: '/container', page: () => const AnimatedContainerScreen()),
          GetPage(name: '/text', page: () => const AnimatedTextStyleScreen()),
          GetPage(name: '/opacity', page: () => const AnimatedOpacityScreen()),
          GetPage(name: '/padding', page: () => const AnimatedPaddingScreen()),
          GetPage(name: '/physical', page: () => const AnimatedPhysicalModelScreen()),
          GetPage(name: '/crossfade', page: () => const AnimatedCrossFadeScreen()),
          GetPage(name: '/lottie', page: () => const AnimatedLottieScreen()),
          GetPage(name: '/flare', page: () => const AnimatedRivScreen()),
        ],
      ),
    );
  }
}
