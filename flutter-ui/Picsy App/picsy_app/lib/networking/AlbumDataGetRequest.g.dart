// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AlbumDataGetRequest.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AlbumDataGetRequest implements AlbumDataGetRequest {
  _AlbumDataGetRequest(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'http://www.demoaws.picsy.in/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AlbumModel> getResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AlbumModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AlbumModel.fromJson(_result.data!);
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
