import 'dart:io';

import 'package:bloc_example/src/data/datasources/remote/artwork_api_service.dart';
import 'package:dio/dio.dart';

import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:bloc_example/src/core/resources/data_state.dart';
import 'package:bloc_example/src/core/params/artwork_request.dart';
import 'package:bloc_example/src/domain/repositories/artwork_repository.dart';

class ArtworkRepositoryImpl implements ArtworkRepository {
  final ArtworkApiService _artworkApiService;
  const ArtworkRepositoryImpl(this._artworkApiService);

  @override
  Future<DataState<List<Artwork>>> getArtworks(
      {ArtworkRequestParams? articlesRequestParams}) async {
    try {
      final httpResponse = await _artworkApiService.getArtworksData(
          page: articlesRequestParams!.page,
          pageSize: articlesRequestParams.pageSize);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.artworks);
      }
      return DataFailed(DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioErrorType.response,
          requestOptions: httpResponse.response.requestOptions));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
