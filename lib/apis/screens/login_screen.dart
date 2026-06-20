import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String email, password) async {
    http.Response response = await http.post(
      Uri.parse(
        'https://glowlensbackend.onrender.com/api/docs/#/Auth/post_api_auth_login',
      ),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
    } else {
      print('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen API')),
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Log In')),
        ],
      ),
    );
  }
}
