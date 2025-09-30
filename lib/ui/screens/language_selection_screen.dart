import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ routes/app_pages.dart';
import '../widgets/primary_button.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String selected = 'English (US)';

  final languages = [
    'English (US)',
    'Indonesia',
    'Afghanistan',
    'Algeria',
    'Malaysia',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, foregroundColor: Colors.black),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text('What is Your Mother Language', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: languages.length,
              separatorBuilder: (_,__) => SizedBox(height: 8),
              itemBuilder: (context, i) {
                final lang = languages[i];
                final sel = selected == lang;
                return ListTile(
                  onTap: () => setState(() => selected = lang),
                  leading: CircleAvatar(child: Text(lang[0])),
                  title: Text(lang),
                  trailing: sel ? Icon(Icons.check_circle, color: Colors.blue) : TextButton(onPressed: () => setState(()=>selected = lang), child: Text('Select')),
                );
              },
            ),
          ),
          PrimaryButton(label: 'Continue', onPressed: () => Get.offAllNamed(Routes.SIGN_IN))
        ]),
      ),
    );
  }
}
