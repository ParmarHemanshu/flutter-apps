import 'package:dio/dio.dart';
import 'package:picsy_app/models/AlbumModel.dart';
import 'package:retrofit/http.dart';

part 'ApiRequest.g.dart';

@RestApi(baseUrl: "http://www.demoaws.picsy.in/api/")
abstract class ApiRequest {
  factory ApiRequest(Dio dio, {required String baseUrl}) {
    dio.interceptors
        .add(LogInterceptor(requestBody: false, responseBody: true));
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer 950756f02948a64e992eaee4626a4818db59c4ed',
      },
    );
    return _ApiRequest(dio, baseUrl: baseUrl);
  }

  @GET("/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108")
  Future<Album> getResponse();

}
