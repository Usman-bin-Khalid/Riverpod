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

  // Agr hmary pass jo api ka response aya hy wo is form mai hy [{}, {}] means
  // list of objects hyn to hum function likhty huy List bhi likhyn gy jesa k
  // Future<List<CommentsModel>> getCommentsAPI() async {
  // or agr api ka response is form mai hy {} means object hy to hum function mai List nai likhyn gy jesa k
  // Future<CommentsModel> getCommentsAPI() async {

  // You can also use the same above API integration method with this
  // Future<List<CommentsModel>> getCommentsAPI() async {
  // final response = await http.get(
  // Uri.parse("https://jsonplaceholder.typicode.com/comments"),
  //);

  //if (response.statusCode == 200) {
  //final data = jsonDecode(response.body);

  //return (data as List)
  //  .map((e) => CommentsModel.fromJson(e))
  //.toList();
  //  }
   //  throw Exception("Failed");
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comments API')),
      body: FutureBuilder(
        future: getCommentsAPI(),
        builder: (context, snapshopt) {
          if (!snapshopt.hasData) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(commentList[index].id.toString()),
                    Text(commentList[index].postId.toString()),
                    Text(commentList[index].name!),
                    Text(commentList[index].email!),
                    Text(commentList[index].body!),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
