import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final bool signInFlow;
  const SuccessPopup({super.key, this.signInFlow = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                child: const Icon(Icons.close, size: 18, color: Colors.black54),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.08),
                    ),
                  ),
                  Container(
                    width: 78,
                    height: 78,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue.withOpacity(0.16),
                    ),
                  ),
                  Container(
                    width: 62,
                    height: 62,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 36),
                  ),
                  const Positioned(
                    left: 8,
                    top: 18,
                    child: Icon(Icons.star, size: 12, color: Colors.blueAccent),
                  ),
                  const Positioned(
                    right: 10,
                    bottom: 22,
                    child: Icon(Icons.star, size: 10, color: Colors.lightBlue),
                  ),
                  const Positioned(
                    right: 26,
                    top: 14,
                    child: Icon(Icons.star, size: 8, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              signInFlow ? "Signed In" : "Successfully Registered",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              signInFlow
                  ? "Welcome back! You are signed in."
                  : "Your account has been registered successfully, now let's enjoy our features!",
              style: const TextStyle(color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                // --- THIS IS THE CORRECTED LOGIC ---
                onPressed: () {
                  if (signInFlow) {
                    // After Sign In: Go to home screen and remove all previous screens
                    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                  } else {
                    // After Sign Up: Pop the dialog AND the sign-up screen
                    // to return to the sign-in screen.
                    Navigator.pop(context); // close dialog
                    Navigator.pop(context); // close signup screen
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("Continue", style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}