// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostApiCall.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _PostApiClient implements PostApiClient {
  _PostApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gorest.co.in/public/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Post> uploadPost() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Post>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/posts',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Post.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
