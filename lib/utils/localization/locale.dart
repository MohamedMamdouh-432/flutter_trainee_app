import 'package:get/get.dart';

class AppLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'Home': 'Home Page',
      'Arabic': 'Arabic',
      'English': 'English',
      'German': 'German',
      'Hardest Choices Require Strongest Wills': 'Hardest Choices Require Strongest Wills',
    },
    'ar': {
      'Home': 'الصفحة الرئيسية',
      'Arabic': 'العربية',
      'English': 'الإنجليزية',
      'German': 'الألمانية',
      'Hardest Choices Require Strongest Wills': 'أصعب الأختيارات تتطلب أقوى الإرادات'
    },
    'de': {
      'Home': 'Startseite',
      'Arabic': 'Arabisch',
      'English': 'Englisch',
      'German': 'Deutsch',
      'Hardest Choices Require Strongest Wills': 'Die schwierigsten Entscheidungen erfordern den stärksten Willen',
    }
  };
}