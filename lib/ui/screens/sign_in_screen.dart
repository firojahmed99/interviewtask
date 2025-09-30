import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'success_popup.dart';

class SignInController extends GetxController {
  final emailController = TextEditingController(text: 'pristia@gmail.com');
  final passwordController = TextEditingController(text: 'password123');

  var isPasswordVisible = false.obs;
  var rememberMe = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  void _showSignInSuccess(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const SuccessPopup(signInFlow: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    final SignInController c = Get.put(SignInController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),

                // Logo Icon
                const Center(
                  child: Icon(Icons.menu_book, size: 80, color: Colors.blue),
                ),
                const SizedBox(height: 24),

                const Center(
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),

                const Center(
                  child: Text(
                    "Please login first to start your Theory Test.",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                const SizedBox(height: 24),

                // Email field
                TextField(
                  controller: c.emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    hintText: "pristia@gmail.com",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // Password field (reactive visibility toggle)
                Obx(() => TextField(
                  controller: c.passwordController,
                  obscureText: !c.isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "********",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    suffixIcon: IconButton(
                      icon: Icon(c.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        c.isPasswordVisible.toggle();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
                const SizedBox(height: 10),

                // Remember & Forgot
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Row(
                      children: [
                        Checkbox(
                          value: c.rememberMe.value,
                          onChanged: (v) => c.rememberMe.value = v ?? false,
                        ),
                        const Text("Remember Me"),
                      ],
                    )),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot Password"),
                    )
                  ],
                ),
                const SizedBox(height: 16),

                // Sign In button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => _showSignInSuccess(context),
                    child: const Text(
                      "Sign In",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Create Account link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: "New to Theory Test? ",
                        style: TextStyle(color: Colors.black87),
                        children: [
                          TextSpan(
                            text: "Create Account",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
