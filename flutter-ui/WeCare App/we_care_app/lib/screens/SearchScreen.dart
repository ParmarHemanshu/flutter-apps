import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Common Symptoms",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final List items = [
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Knee injury",
    "Arm Pain",
    "Athleet's foot",
    "Knee injury",
    "Abdominal pain: FeMale",
    "Asthama Attack",
    "Abdominal pain: Male",
    "Abdominal pain: FeMale",
    "Animal Bite",
    "Knee injury",
    "Arm Pain"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.blueAccent,
              onPressed: () {},
            ),
            title: TextField(
              decoration: InputDecoration(hintText: "Enter patient's name"),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ))
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "images/bg.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        child: Image.asset(
                          "images/logo.png",
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 5, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                items[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              ));
                            },
                            itemCount: items.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(
                                height: 2,
                                color: Colors.grey,
                              );
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
