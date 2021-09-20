import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picsy_app/models/AlbumModel.dart';
import 'package:picsy_app/networking/ApiRequest.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(Icons.menu));
                },
              ),
              iconTheme: IconThemeData(color: Colors.black),
              backwardsCompatibility: false,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarColor: Colors.redAccent),
              backgroundColor: Colors.white,
              elevation: 1,
              title: Image.asset(
                "images/logo.png",
                height: kToolbarHeight,
                //  width: 50,
              ),
              centerTitle: true,
              actions: [
                Icon(
                  Icons.add_alert,
                  size: 24,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 12, left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    onPressed: () => {},
                    child: Text(
                      "chat",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Icon(
                    Icons.more_vert_rounded,
                    size: 24,
                  ),
                )
              ],
            ),
            body: _responseOnCall(context)));
  }
}

FutureBuilder<Album> _responseOnCall(BuildContext context) {
  String url = "http://www.demoaws.picsy.in/api/";
  final apiClient = ApiRequest(Dio(), baseUrl: url);
  return FutureBuilder<Album>(
      future: apiClient.getResponse(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<BookData>? listData = snapshot.data?.response!.bookData;
            return _buildListView(context, listData!);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            print("Waiting for Connection..");
          } else if (snapshot.connectionState == ConnectionState.active) {
            print("Connected successfully");
          } else {
            Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
                strokeWidth: 5,
              ),
            );
          }
        } on DioError catch (e) {
          _checkDioErrors(e);
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.redAccent,
            strokeWidth: 5,
          ),
        );
      });
}

void _checkDioErrors(DioError e) {
  if (e.type == DioErrorType.response) {
    print("Response Success");
  } else if (e.type == DioErrorType.receiveTimeout) {
    print("Get request timeout");
  } else if (e.type == DioErrorType.connectTimeout) {
    print("Connection timeout");
  } else if (e.type == DioErrorType.other) {
    print("Dio Error !!");
  } else {
    print("Something Went wrong !!!");
  }
}

Widget _buildListView(BuildContext context, List<BookData> albums) {
  return ListView.builder(
    itemCount: albums.length,
    itemBuilder: (context, index) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.32,
        padding: EdgeInsets.all(10),
        child: Expanded(
          child: Card(
            elevation: 4,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                            albums[index].imgHttpThumb,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                albums[index].yearbookName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  albums[index].yearbookDescription.desc,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Pages : ",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "min 20 - max 50",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Est. Delivery :",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          " 5-7 working days",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        albums[index].yearbookDescription.price,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.white,
                              ),
                              label: Text(
                                "preview",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.black54))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              label: Text(
                                "create ",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent))),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
