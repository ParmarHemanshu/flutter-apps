import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:picsy_app/screens/QuotesScreen.dart';

class HomePageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(
                            backgroundImage: AssetImage("images/logo.png")),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Hemanshu Parmar",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152637_8098.png",
                  height: 30,
                  width: 30,
                ),
                title: Text("My Gifts"),
                trailing: Icon(Icons.new_releases, color: Colors.redAccent),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuotesScreen()));
                },
                child: ListTile(
                  leading: Image.network(
                      "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152624_79307.png",
                      height: 30,
                      width: 30),
                  title: Text("Blogs"),
                ),
              ),
              ListTile(
                leading: Image.network(
                    "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152656_47415.png",
                    height: 30,
                    width: 30),
                title: Text("Categories"),
              ),
              ListTile(
                leading: Image.network(
                    "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152724_1190.png",
                    height: 30,
                    width: 30),
                title: Text("New Albums"),
                trailing: Icon(Icons.new_releases, color: Colors.redAccent),
              ),
              ListTile(
                leading: Image.network(
                    "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152712_80995.png",
                    height: 30,
                    width: 30),
                title: Text("Earn Rewards"),
                trailing:
                Icon(Icons.monetization_on_outlined, color: Colors.green),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Divider(
                      height: 4,
                      color: Colors.black,
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text("Log Out"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}