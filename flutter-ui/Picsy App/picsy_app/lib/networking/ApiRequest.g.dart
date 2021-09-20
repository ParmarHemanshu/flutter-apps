// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiRequest.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiRequest implements ApiRequest {
  _ApiRequest(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://www.demoaws.picsy.in/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Album> getResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Album>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Album.fromJson(_result.data!);
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
