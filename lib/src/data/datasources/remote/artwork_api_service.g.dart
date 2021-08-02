// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ArtworkApiService implements ArtworkApiService {
  _ArtworkApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.artic.edu/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<AllArtworkResponseModel>> getArtworksData(
      {required page, required pageSize}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'current_page': page,
      r'limit': pageSize
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<AllArtworkResponseModel>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/artworks/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AllArtworkResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
