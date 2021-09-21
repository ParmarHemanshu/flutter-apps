import 'package:flutter/material.dart';
import 'package:picsy_app/widgets/AppBar.dart';
import 'package:picsy_app/widgets/BottomNavBar.dart';
import 'package:picsy_app/widgets/Drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double halfScreenWidth = MediaQuery.of(context).size.width * 0.5;
    return Scaffold(
        appBar: Appbar(),
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
              child: _singleCardBuilder(
                  "Photo Books",
                  "Convert photos to printed photo books",
                  "499",
                  "https://www.picsy.in/images/app/New-App/dashboard/Photobook.jpg"),
            ),

            //method for double card build
            _doubleCardsBuilder(
                halfScreenWidth,
                "Photo Calenders",
                "499",
                "https://www.picsy.in/images/app/New-App/dashboard/Calendar.jpg",
                "Photo Prints",
                "399",
                "https://www.picsy.in/images/app/New-App/dashboard/Photoprint.jpg"),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: _singleCardBuilder(
                  "Canvas Print",
                  "Photos on canvas for walls",
                  "999",
                  "https://www.picsy.in/images/app/New-App/dashboard/Canvas.jpg"),
            ),
          ],
        ),
        drawer: HomePageDrawer(),
        bottomNavigationBar: BottomNavBar());
  }
}

Card _singleCardBuilder(
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

Row _doubleCardsBuilder(double width, String title, String price,
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
