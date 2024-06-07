
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  final Widget? child; // Child widget to navigate to after the splash screen
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  widget.child!), 
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return const Scaffold(
      body: Center(
        child: Text(
          "Contact Pro",
          style: TextStyle(
            color: Color.fromARGB(255, 10, 40, 211),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
