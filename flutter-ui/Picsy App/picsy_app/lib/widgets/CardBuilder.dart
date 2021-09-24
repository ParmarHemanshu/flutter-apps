import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCardBuilder extends StatelessWidget {

  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;


  SingleCardBuilder(this.title, this.subtitle, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
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
}

class DoubleCardBuilder extends StatelessWidget {
  final double width;
  final String title;
  final String price;
  final String imageUrl;
  final String title2;
  final String price2;
  final String imageUrl2;


 DoubleCardBuilder(this.width, this.title, this.price, this.imageUrl,
      this.title2, this.price2, this.imageUrl2);

  @override
  Widget build(BuildContext context) {
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
}

