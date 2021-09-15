import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double halfScreenWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
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
      body: ListView(
        children: [
          Container(
            child: Card(
              child: Image.network(
                  "https://www.picsy.in/images/app/New-Dashboard/share-album.jpg"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            //method for single card build
            child: singleCardBuilder(
                "Photo Books",
                "Convert photos to printed photo books",
                "499",
                "https://www.picsy.in/images/app/New-App/dashboard/Photobook.jpg"),
          ),

          //method for double card build
          doubleCardsBuilder(
              halfScreenWidth,
              "Photo Calenders",
              "499",
              "https://www.picsy.in/images/app/New-App/dashboard/Calendar.jpg",
              "Photo Prints",
              "399",
              "https://www.picsy.in/images/app/New-App/dashboard/Photoprint.jpg"),

          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: singleCardBuilder(
                "Canvas Print",
                "Photos on canvas for walls",
                "999",
                "https://www.picsy.in/images/app/New-App/dashboard/Canvas.jpg"),
          ),
        ],
      ),
      drawer: HomePageDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.network(
                "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152637_8098.png",
                height: 24,
                width: 24,
              ),
              label: "Gift Card"),
          BottomNavigationBarItem(
            icon: Image.network(
                "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152624_79307.png",
                height: 24,
                width: 24),
            label: "Designs",
          ),
          BottomNavigationBarItem(
              icon: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152656_47415.png",
                  height: 24,
                  width: 24),
              label: "My Orders"),
          BottomNavigationBarItem(
              icon: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152724_1190.png",
                  height: 24,
                  width: 24),
              label: "Albums"),
          BottomNavigationBarItem(
              icon: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152712_80995.png",
                  height: 24,
                  width: 24),
              label: "Rewards"),
        ],
      ),
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Drawer(
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
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152624_79307.png",
                  height: 30,
                  width: 30),
              title: Text("More Designs"),
            ),
            ListTile(
              leading: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152656_47415.png",
                  height: 30,
                  width: 30),
              title: Text("Previous Orders"),
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
    );
  }
}

Card singleCardBuilder(
    String title, String subtitle, String price, String imageUrl) {
  return Card(
    child: Column(
      children: [
        Image.network(imageUrl),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      "From  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "₹ " + price,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.redAccent),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(
              subtitle,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
          ]),
        )
      ],
    ),
  );
}

Row doubleCardsBuilder(double width, String title, String price,
    String imageUrl, String title2, String price2, String imageUrl2) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SizedBox(
          width: (width - 20),
          child: Card(
            child: Column(
              children: [
                Container(
                  child: Image.network(imageUrl),
                ),
                Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        "From  ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "₹ " + price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SizedBox(
          width: (width - 20),
          child: Card(
            child: Column(
              children: [
                Image.network(imageUrl2),
                Container(
                  margin: EdgeInsets.only(top: 8, left: 8),
                  child: Row(
                    children: [
                      Text(
                        title2,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        "From  ",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "₹ " + price2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
