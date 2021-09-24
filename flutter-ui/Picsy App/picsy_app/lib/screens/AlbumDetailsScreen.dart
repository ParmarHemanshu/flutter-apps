import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:picsy_app/models/AlbumModel.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final Data bookData;

  const AlbumDetailsScreen({Key? key, required this.bookData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          bookData.yearbookName.toString(),
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Icon(
            Icons.add_alert,
            size: 24,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, left: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
              ),
              onPressed: () => {},
              child: Text(
                "Create",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: Icon(
              Icons.more_vert_rounded,
              color: Colors.black,
              size: 24,
            ),
          )
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 10),
          child: Container(
              height: 120, width: screenWidth, child: _displayBannerImage()),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
          child: _displayDesc(screenWidth),
        ),
        _buildGridView(),
      ]),
      bottomNavigationBar: Container(
        color: Colors.black12,
        height: kBottomNavigationBarHeight,
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Text("Create Now"),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          ),
        ),
      ),
    ));
  }

  Widget _displayDesc(double screenWidth) {
    if (bookData.appPreviewDescription == null) {
      return Container(
          height: 40,
          width: screenWidth,
          child: Center(
            child: Text(
              "Description is Not available.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ));
    } else {
      return SizedBox(
          width: screenWidth,
          child: Html(
            style: {
              "font":
                  Style(fontSize: FontSize.large, fontWeight: FontWeight.bold),
              "html": Style(
                  backgroundColor: Colors.white24,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.medium)
            },
            data: bookData.appPreviewDescription,
          ));
    }
  }

  Widget _displayBannerImage() {
    if (bookData.yearbookBanner == null) {
      return Image.network(
        bookData.imgHttpThumb.toString(),
        fit: BoxFit.fill,
      );
    } else if (bookData.yearbookBanner == null &&
        bookData.imgHttpThumb == null) {
      return Image.asset(
        "images/logo.png",
        fit: BoxFit.cover,
      );
    } else {
      return Image.network(
        bookData.yearbookBanner.toString(),
        fit: BoxFit.cover,
      );
    }
  }

  Widget _buildGridView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      shrinkWrap: true,
      itemCount: bookData.pages!.length,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      physics: NeverScrollableScrollPhysics(),
      staggeredTileBuilder: (int index) {
        return StaggeredTile.count(_giveCountToGridView(index), 1);
      },
      itemBuilder: (BuildContext context, int index) {
        return buildGridItem(index);
      },
    );
  }

  int _giveCountToGridView(int index) {
    if (index == 0 || index == bookData.pages!.length - 1) {
      return 2;
    } else {
      return 1;
    }
  }

  Widget buildGridItem(int index) {
    if (index == 0) {
      return _buildFrontOrBackCover(index, "Front Cover");
    } else if (index == bookData.pages!.length - 1) {
      return _buildFrontOrBackCover(index, "Back Cover");
    }
    return Container(
      child: _buildNetworkOrGreyImage(index),
    );
  }

  _buildNetworkOrGreyImage(int index) {
    if (index == 1) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/grey.png",
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text("Page : 1"),
          ),
        ],
      );
    }
    if (index == bookData.pages!.length - 2) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/grey.png",
            height: 150,
          ),
        ],
      );
    }
    if (index == bookData.pages!.length - 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.network(
                bookData.pages![index].imageData![0].thumb.toString()),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 10),
            child: Text("Page : " + (index - 1).toString()),
          )
        ],
      );
    } else if (index.isOdd) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.network(
                bookData.pages![index].imageData![0].thumb.toString()),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, left: 10),
            child: Text(
                "Pages : " + (index - 1).toString() + "-" + (index).toString()),
          )
        ],
      );
    }

    return Image.network(
      bookData.pages![index].imageData![0].thumb.toString(),
      height: 100,
      width: 100,
    );
  }

  Widget _buildFrontOrBackCover(index, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Image.network(
              bookData.pages![index].imageData![0].thumb.toString(),
              height: 200,
              width: 200,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                desc,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
