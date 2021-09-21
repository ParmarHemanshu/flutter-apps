import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picsy_app/models/PostModel.dart';
import 'package:picsy_app/networking/PublicApiCalls/GetApiCall.dart';
import 'package:picsy_app/widgets/AppBar.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Appbar(),
      body: _fetchApiData(context),
    ));
  }
}

FutureBuilder<Post> _fetchApiData(BuildContext context) {
  String url = "https://gorest.co.in/public/v1";
  final apiClient = ApiClient(
      Dio(BaseOptions(
          contentType: "application/json",
          connectTimeout: 30000,
          receiveTimeout: 30000)),
      baseUrl: url);
  return FutureBuilder<Post>(
      future: apiClient.getPosts(),
      builder: (context, snapshot) {
        final List<Datum> posts = snapshot.data!.data;
        return buildPost(context, posts);
      });
}

ListView buildPost(BuildContext context, List<Datum>? posts) {
  return ListView.builder(
    itemCount: posts!.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        color: Colors.lightBlueAccent,
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.30,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Text(
                  posts[index].title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Text(
                    posts[index].body,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
