import 'package:flutter/material.dart';
import 'package:picsy_app/widgets/AlertDialog.dart';
import 'package:picsy_app/widgets/AppBar.dart';
import 'package:picsy_app/widgets/BottomNavBar.dart';
import 'package:picsy_app/widgets/CardBuilder.dart';
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
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConnectionLostDialogBuilder(context);
                    });

                print("on tap");
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                //method for single card build
                child: SingleCardBuilder(
                    "Photo Books",
                    "Convert photos to printed photo books",
                    "499",
                    "https://www.picsy.in/images/app/New-App/dashboard/Photobook.jpg"),
              ),
            ),

            //method for double card build
            DoubleCardBuilder(
                halfScreenWidth,
                "Photo Calenders",
                "499",
                "https://www.picsy.in/images/app/New-App/dashboard/Calendar.jpg",
                "Photo Prints",
                "399",
                "https://www.picsy.in/images/app/New-App/dashboard/Photoprint.jpg"),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: SingleCardBuilder(
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
