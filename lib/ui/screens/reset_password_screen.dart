import 'package:flutter/material.dart';

// The main function is the starting point for all Flutter apps.
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reset Password',
      theme: ThemeData(
        // Use the Inter font, which is clean and modern.
        fontFamily: 'Inter',
        // Set the primary color to a nice blue, similar to the button in the screenshot.
        primarySwatch: Colors.blue,
        // Remove the debug banner from the corner of the app.
      ),
      // The home property sets the first screen of the app.
      home: const ResetPasswordScreen(),
    );
  }
}

// This is the widget for the actual "Reset Password" screen.
// It's a StatefulWidget because we need to manage the state of the password visibility.
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Boolean variables to track if the passwords should be visible or hidden.
  bool _isNewPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic structure of a visual interface in Flutter.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Make the app bar transparent and remove the shadow.
        backgroundColor: Colors.white,
        elevation: 0,
        // Add a back button with a black icon.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // In a real app, this would navigate back to the previous screen.
            // For this example, we'll just print to the console.
            print("Back button pressed");
          },
        ),
      ),
      // The body of the scaffold contains the main content of the screen.
      body: SafeArea(
        // Padding adds space around the content.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          // A Column arranges its children widgets vertically.
          child: Column(
            // Align children to the start (top) of the column.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Add some space from the top.
              const SizedBox(height: 20),
              // The main title "Reset Password".
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add space between the title and the subtitle.
              const SizedBox(height: 16),
              // The subtitle text with instructions.
              Text(
                'Your password must be at least 8 characters long and include a combination of letters, numbers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),

              // --- New Password Text Field ---
              TextField(
                // This hides the text for password entry.
                obscureText: _isNewPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  // Suffix icon to toggle password visibility.
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Change the icon based on whether the password is obscured or not.
                      _isNewPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      // Update the state to toggle visibility.
                      setState(() {
                        _isNewPasswordObscured = !_isNewPasswordObscured;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // --- Confirm New Password Text Field ---
              TextField(
                obscureText: _isConfirmPasswordObscured,
                decoration: InputDecoration(
                  labelText: 'Confirm New Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // --- Submit Button ---
              // SizedBox is used to make the button take the full width.
              SizedBox(
                width: double.infinity,
                // The main action button.
                child: ElevatedButton(
                  onPressed: () {
                    // Action for the submit button.
                    print("Submit button pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    // Set the background color of the button.
                    backgroundColor: Colors.blue,
                    // Set the text color.
                    foregroundColor: Colors.white,
                    // Add padding inside the button.
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    // Make the button have rounded corners.
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}