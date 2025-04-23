import 'package:flutter/material.dart';
import 'package:untitled/SingUP.dart';
import 'package:untitled/login.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool showLogin = true;
  
  // Toggle between login and signup screens
  void _toggleAuthMode() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  // Handle successful authentication
  void _handleAuthSuccess() {
    Navigator.of(context).pushReplacementNamed('/home'); // Replace with your home route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: showLogin
            ? LogIN_Screen(
                _toggleAuthMode,
                key: const ValueKey('LoginScreen'),
                onSuccess: _handleAuthSuccess,
              )
            : SignUp_Screen(
                _toggleAuthMode,
                key: const ValueKey('SignUpScreen'),
                onSuccess: _handleAuthSuccess,
              ),
      ),
    );
  }
}