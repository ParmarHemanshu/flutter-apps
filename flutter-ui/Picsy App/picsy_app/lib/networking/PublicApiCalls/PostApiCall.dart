import 'package:dio/dio.dart';
import 'package:picsy_app/models/PostModel.dart';
import 'package:retrofit/http.dart';
part 'PostApiCall.g.dart';

@RestApi(baseUrl: "https://gorest.co.in/public/v1")
abstract class PostApiClient{
  factory PostApiClient(Dio dio, {required baseUrl}){
    dio.interceptors.add(LogInterceptor(responseBody: true,requestHeader: true)
    );
    return _PostApiClient(dio,baseUrl:baseUrl);
  }
  @GET("/posts")
  Future<Post> uploadPost();
}