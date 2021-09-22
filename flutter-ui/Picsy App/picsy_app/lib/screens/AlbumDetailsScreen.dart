import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picsy_app/models/AlbumModel.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final BookData bookData;

  const AlbumDetailsScreen({Key? key, required this.bookData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: Text("Item Details"),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  Image.network(bookData.imgHttpThumb),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      bookData.yearbookName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(bookData.yearbookDescription.desc),
                  ),
                ],
              ),
            )));
  }
}
