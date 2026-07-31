import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_code/apis/models/comments_model.dart';

class CommentsApiScreen extends StatefulWidget {
  const CommentsApiScreen({super.key});

  @override
  State<CommentsApiScreen> createState() => _CommentsApiScreenState();
}

class _CommentsApiScreenState extends State<CommentsApiScreen> {
  List<CommentsModel> commentList = [];
  Future<List<CommentsModel>> getCommentsAPI() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        commentList.add(CommentsModel.fromJson(i));
      }
      return commentList;
    } else {
      return commentList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
