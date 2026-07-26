import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_code/apis/models/photos_model.dart';

class PhotosApiScreen extends StatefulWidget {
  const PhotosApiScreen({super.key});

  @override
  State<PhotosApiScreen> createState() => _PhotosApiScreenState();
}

class _PhotosApiScreenState extends State<PhotosApiScreen> {
  List<PhotosModel> _photosList = [];
  Future<List<PhotosModel>> getPhotosAPI() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        _photosList.add(PhotosModel.fromJson(i));
      }
      return _photosList;
    } else {
      return _photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getPhotosAPI(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
           return ListView.builder(
              itemCount: _photosList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                          
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
