
import 'package:dio/dio.dart';
import 'package:picsy_app/models/AlbumModel.dart';
import 'package:retrofit/http.dart';
part 'AlbumDataGetRequest.g.dart';

@RestApi(baseUrl: "http://www.demoaws.picsy.in/api/")
abstract class AlbumDataGetRequest{
  factory AlbumDataGetRequest(Dio dio,{required String baseurl}){
    dio.interceptors
        .add(LogInterceptor(requestBody: false, responseBody: true,responseHeader: true));
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
         'X-API-Version':'v2',
         'Accept':'*/*' ,
        'Authorization': 'Bearer 515ebb4f3860bd8b7a2d8e2fb2de3ceb47900ce0',
        },
    );
        return _AlbumDataGetRequest(dio,baseUrl :baseurl);
  }
  @GET("/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108")
  Future<AlbumModel> getResponse();
}