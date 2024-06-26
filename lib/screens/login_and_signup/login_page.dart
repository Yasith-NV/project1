import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:project1/global_utility_funtions/email_toast.dart';
import 'package:project1/routes/app_router.gr.dart';
import 'package:project1/screens/login_and_signup/login_signup_widgets/form_container_widget.dart';
import 'package:project1/services/firebase_auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';


@RoutePage()
// Login Page Widget
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

// State class for the Login Page
class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSigningIn = false;
  bool _isOnline = true;
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  // Check if the user is already logged in
  Future<void> _checkLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedInState = prefs.getString('loggedInState');

    if (loggedInState == 'logged_in') {
      AutoRouterConfig;
    }
  }

  // Update the connection status when the connectivity changes
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _isOnline = result != ConnectivityResult.none;
    });
    if (!_isOnline) {
      showToast(message: "No internet connection. Please check your network settings.");
    }
  }

  // Sign in the user
  Future<void> _signIn() async {
    if (!_isOnline) {
      showToast(message: "No internet connection. Please check your network settings.");
      return;
    }

    setState(() {
      _isSigningIn = true;
    });

    User? user = await _authServices.signInWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (user != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('loggedInState', 'logged_in');

      showToast(message: "User is successfully signed in");
      AutoRouter.of(context).push(const ContactForm());

    } else {
      showToast(message: "Failed to sign in. Please check your credentials.");
    }

    setState(() {
      _isSigningIn = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Contact Pro"),
        titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 10, 40, 211), fontSize: 22, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 36),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              const SizedBox(height: 12),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSigningIn ? null : _signIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 40, 211),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isSigningIn
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Login", style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () =>(
          
                      AutoRouter.of(context).push(const SignUpRoute())
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 40, 211)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}