import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_options.dart';
import 'screens/login_and_signup/login_page.dart';
import 'screens/login_and_signup/sign_up_page.dart';
import 'screens/contact_form.dart'; 
import 'screens/ticket_info/tickets_list.dart';
import 'screens/ticket_info/ticket_details.dart';
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
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/login',  
      routes: {
        '/login': (context) => const LoginPage(),                  
        '/signup': (context) => const SignUpPage(), 
        '/': (context) => ContactForm(),              
        '/tickets_list': (context) => TicketsList(),         
        '/ticket_details': (context) => const TicketDetail(documentId: ''),     
      },
    );
  }
}
