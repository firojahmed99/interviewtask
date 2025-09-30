import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

void main() {

  Get.put(AuthController());
  runApp(MyApp());
}

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signUpEmail = TextEditingController();
  final signUpName = TextEditingController();
  final signUpPassword = TextEditingController();

  var isLoading = false.obs;
  var rememberMe = false.obs;

  // simple validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!GetUtils.isEmail(value)) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String? value, {int minLen = 6}) {
    if (value == null || value.isEmpty) return 'Password required';
    if (value.length < minLen) return 'Minimum $minLen characters';
    return null;
  }

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1)); // simulate auth
    isLoading.value = false;
    // formally you'd call real auth service -> on success:
    Get.offAllNamed('/home');
  }

  Future<void> signup() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
    // simulate success popup then go home
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.blue),
            SizedBox(height: 16),
            Text('Successfully Registered', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Your account has been registered successfully'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Get.back(); Get.offAllNamed('/home');
            }, child: Text('Continue'))
          ],
        ),
      ),
    ));
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    signUpEmail.dispose();
    signUpName.dispose();
    signUpPassword.dispose();
    super.onClose();
  }
}
