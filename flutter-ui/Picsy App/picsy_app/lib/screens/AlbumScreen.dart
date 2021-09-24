import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsy_app/cubit/AlbumScreenCubit/list_view_cubit.dart';
import 'package:picsy_app/models/AlbumModel.dart';
import 'package:picsy_app/screens/AlbumDetailsScreen.dart';

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
            body: Center(
              child: BlocBuilder<ListViewCubit, ListViewState>(
                builder: (context, state) {
                  if (state is ListViewInitial) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 6,
                    ));
                  } else if (state is ListViewLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.redAccent,
                      strokeWidth: 6,
                    ));
                  } else if (state is ListViewLoaded) {
                    final albums = state.bookDataList;
                    return _buildListView(context, albums);
                  }

                  return Center(child: Text("Coudn't connect to server. !!"));
                },
              ),
            )));
  }
}

Widget _buildListView(BuildContext context, List<Data> albums) {
  return ListView.builder(
    itemCount: albums.length,
    itemBuilder: (context, index) {
      var desc = albums[index].yearbookDescription.desc;
      if (desc == null) {
        desc = "No description yet.";
      }
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlbumDetailsScreen(
                      bookData: albums[index],
                    )),
          );
        },
        child: Container(
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
                              albums[index].imgHttpThumb.toString(),
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  albums[index].yearbookName.toString(),
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
                                    desc,
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
                          albums[index].yearbookDescription!.price,
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
        ),
      );
    },
  );
}
