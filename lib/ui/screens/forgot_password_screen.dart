import 'package:flutter/material.dart';

// The main function is the starting point for all Flutter apps.
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The title of your app
      title: 'Forgot Password',
      // Removes the debug banner from the corner
      debugShowCheckedModeBanner: false,
      // Sets the visual theme of the app
      theme: ThemeData(
        // Use Material 3 design
        useMaterial3: true,
        // Set the primary color swatch
        primarySwatch: Colors.blue,
        // Define the font family
        fontFamily: 'Inter',
      ),
      // The home property defines the default screen of your app.
      home: const ForgotPasswordScreen(),
    );
  }
}

// This widget represents the "Forgot Password" screen.
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold implements the basic material design visual layout structure.
    return Scaffold(
      // Sets the background color of the screen
      backgroundColor: Colors.white,
      // The AppBar is the top bar of the screen.
      appBar: AppBar(
        // Makes the AppBar transparent
        backgroundColor: Colors.white,
        // Removes the shadow below the AppBar
        elevation: 0,
        // Adds a leading widget, in this case, a back button icon.
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            // Sets the icon color to black
            color: Colors.black,
          ),
          // Defines what happens when the button is pressed.
          onPressed: () {
            // In a real app, this would navigate to the previous screen.
            // For this example, it does nothing.
          },
        ),
      ),
      // The body of the Scaffold contains the main content of the screen.
      body: Padding(
        // Adds padding around the content.
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // Aligns children to the start (left) of the column.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adds some vertical space.
            const SizedBox(height: 40),

            // Main title text.
            const Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // Adds a small vertical space.
            const SizedBox(height: 12),

            // Subtitle text.
            Text(
              'Enter your email, we will send a\nverification code to email',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            // Adds a larger vertical space.
            const SizedBox(height: 48),

            // Label for the email text field.
            const Text(
              'Email Address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            // Adds a small vertical space.
            const SizedBox(height: 8),

            // The text field for email input.
            TextField(
              // Sets the keyboard type to one suitable for email addresses.
              keyboardType: TextInputType.emailAddress,
              // Provides styling for the text field.
              decoration: InputDecoration(
                // The hint text shown when the field is empty.
                hintText: 'pristia@gmail.com',
                // Hint text style
                hintStyle: TextStyle(color: Colors.grey[400]),
                // The border shown when the text field is enabled.
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
                ),
                // The border shown when the text field is focused (tapped on).
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.blue, width: 1.5),
                ),
                // Adds padding inside the text field.
                contentPadding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
            ),

            // Adds a large vertical space before the button.
            const SizedBox(height: 32),

            // The main action button.
            SizedBox(
              // Makes the button take the full width available.
              width: double.infinity,
              // A button with a solid background color.
              child: ElevatedButton(
                // The function that is called when the button is pressed.
                onPressed: () {
                  // Action for continue button
                },
                // The content inside the button.
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // Styling for the button.
                style: ElevatedButton.styleFrom(
                  // Sets the button's background color.
                  backgroundColor: Colors.blue[600],
                  // Sets the button's shape.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  // Sets the padding inside the button.
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}