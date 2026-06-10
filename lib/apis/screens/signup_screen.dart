import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Screen')),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(hintText: 'Email'), 
          controller: emailController,),
          TextField(decoration: InputDecoration(hintText: 'Password'), 
          controller: nameController,),
          ElevatedButton(onPressed: () {}, child: Text('Sign Up'))
        ],
      ),
    );
  }
}
