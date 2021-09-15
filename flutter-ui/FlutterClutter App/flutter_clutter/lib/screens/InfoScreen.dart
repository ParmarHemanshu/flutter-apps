import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: "Flutter Clutter",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("About Flutter"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                imageContainerSection(screenHeight, screenWidth),
                //Image Container
                topContainerSection(screenHeight),
                middleContainerSection(screenHeight),
                bottomContainerSection(screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container imageContainerSection(double screenHeight, double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.redAccent, width: 4),
      ),
      width: screenWidth,
      height: screenHeight * 0.25,
      child: Stack(
        children: [
          Container(
            child: Image.asset(
              "images/mt.png",
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              "Mountains",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white30),
              textDirection: TextDirection.ltr,
            ),
          )
        ],
      ),
    );
  }

  Container topContainerSection(double screenHeight) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      margin: EdgeInsets.only(left: 10, right: 10, top: screenHeight * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text(
                  "Flutter is in the Nature.",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 6, top: 4),
                  child: Text(
                    "It is the future of mobile world.",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black45),
                  )),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    child: Icon(
                      Icons.star,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text(
                      "41",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Container middleContainerSection(double screenHeight) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      margin: EdgeInsets.only(left: 10, right: 10, top: screenHeight * 0.02),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildColumn(Colors.blue, Icons.call, "Call"),
          buildColumn(Colors.blue, Icons.navigation_outlined, "Route"),
          buildColumn(Colors.blue, Icons.share, "Share"),
        ],
      ),
    );
  }

  Container bottomContainerSection(double screenHeight) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.redAccent, width: 4),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: EdgeInsets.only(
          top: screenHeight * 0.02, left: 20, right: 20, bottom: 30),
      child: Text(
        "Lake Obscene lies at the foot of the Blemish "
        "in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the"
        "larger Alpine Lakes. A gondola ride from Kindest, followed by a "
        "half-hour walk through pastures and pine forest, leads you to the lack. "
        "in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the"
        "larger Alpine Lakes.",
        softWrap: true,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

Column buildColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: color,
        size: 30,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    ],
  );
}
