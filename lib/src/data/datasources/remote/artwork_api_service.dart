import 'package:bloc_example/src/core/utils/constants.dart';
import 'package:bloc_example/src/data/models/all_artwork_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'artwork_api_service.g.dart';

@RestApi(baseUrl : kBaseUrl)
abstract class ArtworkApiService {
  factory ArtworkApiService(Dio dio,{ String baseUrl}) = _ArtworkApiService;

  @GET('/artworks/')
  Future<HttpResponse<AllArtworkResponseModel>> getArtworksData({
    @Query('current_page') required int page,
    @Query('limit') required int pageSize
  });
}