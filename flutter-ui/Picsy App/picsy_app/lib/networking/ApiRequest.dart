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
        'Authorization': 'Bearer 85b3e9922b97d73fc1e7b1145390eeed4776c1be',
      },
    );
    return _ApiRequest(dio, baseUrl: baseUrl);
  }

  @GET("/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108")
  Future<Album> getResponse();

}
