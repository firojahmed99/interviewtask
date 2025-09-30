import 'package:flutter/material.dart';
import 'package:interviewtask/ui/screens/forgot_password_screen.dart';
import 'package:interviewtask/ui/screens/reset_password_screen.dart';
import ' bindings/initial_binding.dart';
import ' routes/app_pages.dart';
import '/ui/screens/onboarding1_screen.dart';
import '/ui/screens/splash_screen.dart';
import 'ui/screens/onboarding2_screen.dart';
import 'ui/screens/sign_in_screen.dart';
import 'ui/screens/sign_up_screen.dart';
import 'ui/screens/success_popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Eduline App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),

    initialRoute: '/',
    routes: {
    '/': (context) => SplashScreen(),
    '/onboarding1': (context) => Onboarding1Screen(),
    '/onboarding2': (context) => Onboarding2Screen(),
    '/signin': (context) => SignInScreen(),
    '/signup': (context) => SignUpScreen(),
    '/success': (context) => SuccessPopup(),
    '/forgot': (context) => ForgotPasswordScreen(),
    '/reset': (context) => ResetPasswordScreen(),
    '/location_screen': (context) => LocationScreen(),
    '/language_selection_screen': (context) => LanguageSelectionScreen(),
    '/verify_code_screen': (context) => VerifyCodeScreen(),


    },
    );
  }
}
