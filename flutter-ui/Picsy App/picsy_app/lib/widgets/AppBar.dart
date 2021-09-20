import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{
  const Appbar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return AppBar(
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
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return Size.fromHeight(60);
  } 
}
