import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picsy_app/cubit/AlbumScreenCubit/list_view_cubit.dart';
import 'package:picsy_app/networking/AlbumDataGetRequest.dart';
import 'package:picsy_app/networking/PublicApiCalls/PostApiCall.dart';
import 'package:picsy_app/repositories/AlbumRepository.dart';
import 'package:picsy_app/screens/AlbumScreen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostApiClient apiPostCall=PostApiClient(Dio(),baseUrl:"https://gorest.co.in/public/v1" );
    AlbumDataGetRequest albumDataGetRequest=AlbumDataGetRequest(Dio(),baseurl: "http://www.demoaws.picsy.in/api/");

    return BottomNavigationBar(

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
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BlocProvider(
                                create: (context) {
                                  return ListViewCubit(AlbumRepository(apiPostCall,albumDataGetRequest));
                                },
                                child: AlbumScreen())));
              },
              child: Image.network(
                  "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152724_1190.png",
                  height: 24,
                  width: 24),
            ),
            label: "Albums"),
        BottomNavigationBarItem(
            icon: Image.network(
                "https://s3.ap-south-1.amazonaws.com/picsyinlive/images/user_photos/8350/large/USER_PHOTOS_8350_20210326_152712_80995.png",
                height: 24,
                width: 24),
            label: "Rewards"),
      ],
    );
  }
}
