import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project1/routes/app_router.dart';
import 'services/firebase_options.dart';
import './global_widgets/app_theme.dart';




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



   
    // return MaterialApp(
      
    //   title: 'Contact Form App',
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.theme,
    //   initialRoute: '/login',  
    //   home: const SplashScreen( 
    //     child: LoginPage(), 
    //   ),
    //   // routes: {
    //   //   '/login': (context) => const LoginPage(),       
    //   //   '/signup': (context) => const SignUpPage(), 
    //   //   '/contact_form': (context) => ContactForm(),
    //   //   '/tickets_list': (context) => TicketsList(), 
    //   //   '/ticket_details': (context) => const TicketDetail(documentId: ''),   
    //   // },
    // );
  }
}
