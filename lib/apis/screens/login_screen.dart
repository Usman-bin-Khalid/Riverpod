import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen API')),
      body: Column(children: [TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'Email'
        ),
      ),
      TextField(
        controller: passwordController,
        decoration: InputDecoration(
          hintText: 'Password'
        ),
      ),
      
      ]),
    );
  }
}
