import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void logIn(String name, email, password) async {
    try {
      Response response = await post(
        Uri.parse(
          'https://glowlensbackend.onrender.com/api/docs/#/Auth/post_api_auth_signup',
        ),
        body: {'name': name, 'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print('Account created successfully');
      } else {
        print('Failed');
      }
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Screen')),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
            controller: emailController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Password'),
            controller: passwordController,
          ),

          TextField(
            decoration: InputDecoration(hintText: 'Name'),
            controller: nameController,
          ),
          ElevatedButton(
            onPressed: () {
              logIn(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
            },
            child: Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
