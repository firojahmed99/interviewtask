import 'package:flutter/material.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onContinue;

  const SuccessPopup({required this.title, required this.subtitle, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_outline, size: 72, color: Colors.blue),
          SizedBox(height: 12),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(subtitle, textAlign: TextAlign.center),
          SizedBox(height: 16),
          ElevatedButton(onPressed: onContinue, child: Text('Continue'))
        ],
      ),
    );
  }
}
