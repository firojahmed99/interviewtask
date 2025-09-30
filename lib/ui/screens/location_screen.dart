import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ routes/app_pages.dart';
import '../widgets/primary_button.dart';


class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, size: 96, color: Colors.blue),
            SizedBox(height: 20),
            Text('Enable Location', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Kindly allow us to access your location to provide suggestions for nearby sessions.'),
            SizedBox(height: 22),
            PrimaryButton(label: 'Enable', onPressed: () => Get.toNamed(Routes.LANGUAGE_SELECTION)),
            SizedBox(height: 12),
            TextButton(onPressed: () => Get.toNamed(Routes.LANGUAGE_SELECTION), child: Text('Skip, Not Now'))
          ],
        ),
      )),
    );
  }
}
