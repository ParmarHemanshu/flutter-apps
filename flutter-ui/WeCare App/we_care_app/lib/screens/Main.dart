import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_care_app/screens/SearchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WeCare App",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.more_vert_rounded),
                onPressed: () {},
              )
            ],
          ),
          body: Container(
            width: screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("images/bg.png"),
            )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Image.asset(
                        "images/logo.png",
                        height: screenHeight * 0.3,
                        width: screenHeight * 0.3,
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.3,
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.2,
                        left: 10,
                        right: 10,
                        bottom: 30),
                    child: Expanded(
                        child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: (screenWidth / 3) / 80,
                      children: [
                        //// Navigate to next screen
                        GestureDetector(
                          child: buildContainer("SICK ?"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()));
                          },
                        ),
                        buildContainer("ABOUT US"),
                        buildContainer("NEWS"),
                        buildContainer("OFFICE INFO"),
                        buildContainer("PAGE MY DOCTOR"),
                        buildContainer("PORTAL"),
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              buildNavbarItem(Icons.home, screenWidth, screenHeight, false),
              buildNavbarItem(
                  Icons.map_outlined, screenWidth, screenHeight, false),
              buildNavbarItem(
                  Icons.credit_card, screenWidth, screenHeight, false),
              buildNavbarItem(
                  Icons.add_alert_rounded, screenWidth, screenHeight, true),
            ],
          )),
    );
  }

  Container buildNavbarItem(
      IconData icon, double screenWidth, double screenHeight, bool isActive) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth / 4,
      decoration:
          BoxDecoration(color: isActive ? Colors.lightBlue : Colors.white),
      child: isActive
          ? Icon(
              icon,
              color: Colors.white,
              size: 26,
            )
          : Icon(
              icon,
              color: Colors.lightBlue,
              size: 26,
            ),
    );
  }
}

Container buildContainer(String text) {
  return Container(
    padding: EdgeInsets.all(4),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(6)),
    child: Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
