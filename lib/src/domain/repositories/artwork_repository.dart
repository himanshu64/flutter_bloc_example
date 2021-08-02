import 'package:bloc_example/src/core/params/artwork_request.dart';
import 'package:bloc_example/src/core/resources/data_state.dart';
import 'package:bloc_example/src/domain/entities/artwork.dart';

abstract class ArtworkRepository {
  Future<DataState<List<Artwork>>> getArtworks({ArtworkRequestParams articlesRequestParams});
}