import 'package:get/get.dart';
import '../ bindings/api_binding.dart';
import '../ bindings/auth_binding.dart';
import '../ui/screens/splash_screen.dart';
import '../ui/screens/sign_in_screen.dart';
import '../ui/screens/sign_up_screen.dart';
import '../ui/screens/forgot_password_screen.dart';
import '../ui/screens/reset_password_screen.dart';
import '../ui/screens/verify_code_screen.dart';
import '../ui/screens/location_screen.dart';
import '../ui/screens/language_selection_screen.dart';
import '../ui/screens/home_screen.dart';


part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => SplashScreen()),
    GetPage(name: Routes.SIGN_IN, page: () => SignInScreen(), binding: AuthBinding()),
    GetPage(name: Routes.SIGN_UP, page: () => SignUpScreen(), binding: AuthBinding()),
    GetPage(name: Routes.FORGOT_PASSWORD, page: () => ForgotPasswordScreen(), binding: AuthBinding()),
    GetPage(name: Routes.RESET_PASSWORD, page: () => ResetPasswordScreen(), binding: AuthBinding()),
    GetPage(name: Routes.VERIFY_CODE, page: () => VerifyCodeScreen(), binding: AuthBinding()),
    GetPage(name: Routes.LOCATION, page: () => LocationScreen()),
    GetPage(name: Routes.LANGUAGE_SELECTION, page: () => LanguageSelectionScreen()),
    GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: ApiBinding()),
  ];
}
