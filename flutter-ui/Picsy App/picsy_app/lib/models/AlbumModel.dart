import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Album {
  late Response? response;

  Album({required this.response});

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response!.toJson();
    return data;
  }
}

@JsonSerializable()
class Response {
  late List<BookData>? bookData;

  Response({required this.bookData});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      bookData = [];
      json['data'].forEach((v) {
        bookData!.add(BookData.fromJson(v));
      });
    } else {
      print("null caught in bookdata");
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> bookData = new Map<String, dynamic>();
    bookData['data'] = this.bookData!.map((v) => v.toJson()).toList();
    return bookData;
  }
}

@JsonSerializable()
class BookData {
  late String yearbookName;
  late YearbookDescription yearbookDescription;
  late String imgHttpThumb;

  BookData({
    required this.yearbookName,
    required this.yearbookDescription,
    required this.imgHttpThumb,
  });

  BookData.fromJson(Map<String, dynamic> json) {
    yearbookName = json['yearbook_name'];
    yearbookDescription = (json['yearbook_description'] != null
        ? new YearbookDescription.fromJson(json['yearbook_description'])
        : YearbookDescription(desc: "", size: "", price: ""));

    imgHttpThumb = json['img_http_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yearbook_name'] = this.yearbookName;
    data['yearbook_description'] = this.yearbookDescription.toJson();
    data['img_http_thumb'] = this.imgHttpThumb;
    return data;
  }
}

@JsonSerializable()
class YearbookDescription {
  late String desc;
  late String size;
  late String price;

  YearbookDescription({
    required this.desc,
    required this.size,
    required this.price,
  });

  YearbookDescription.fromJson(Map<String, dynamic> json) {
    desc = json['Desc'];
    size = json['Size'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Desc'] = this.desc;
    data['Size'] = this.size;
    data['Price'] = this.price;

    return data;
  }
}
