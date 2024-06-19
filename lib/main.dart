import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/global_widgets/app_theme.dart';
import 'package:project1/routes/app_router.dart';
import 'package:project1/services/firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {


    return MaterialApp.router(
      routerConfig: _appRouter.config(),

      debugShowCheckedModeBanner: false,

      title: 'Contact Form App',

      theme: AppTheme.theme,
    );
  }
}
