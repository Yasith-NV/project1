import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';
import 'screens/contact_form.dart';
import 'global_widgets/version_display.dart';
import 'global_widgets/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Form App',
      theme: AppTheme.theme,
      home: Scaffold(
        appBar: AppBar(title: const Text('Contact Us')),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ContactForm(),
                const SizedBox(height: 20),
                VersionDisplay(), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
