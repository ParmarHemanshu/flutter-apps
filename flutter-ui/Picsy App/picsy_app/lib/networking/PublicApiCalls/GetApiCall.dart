

import 'package:dio/dio.dart';
import 'package:picsy_app/models/PostModel.dart';
import 'package:retrofit/http.dart';
part 'GetApiCall.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v1")
abstract class ApiClient{
  factory ApiClient(Dio dio, {required baseUrl}){
    dio.interceptors.add(LogInterceptor(responseBody: true,requestHeader: true)
    );
return _ApiClient(dio,baseUrl:baseUrl);
  }
  @GET("/posts")
  Future<Post> getPosts();
}