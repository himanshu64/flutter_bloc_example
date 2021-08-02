
import 'package:bloc_example/src/core/params/artwork_request.dart';
import 'package:bloc_example/src/core/resources/data_state.dart';
import 'package:bloc_example/src/core/usecase/usecase.dart';
import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:bloc_example/src/domain/repositories/artwork_repository.dart';

class GetArtworkUseCase implements UseCase<DataState<List<Artwork>>, ArtworkRequestParams> {
  
  final ArtworkRepository _artworkRepository;
  GetArtworkUseCase(this._artworkRepository);

  @override
  Future<DataState<List<Artwork>>> call({ArtworkRequestParams? params}) {
    return _artworkRepository.getArtworks(articlesRequestParams: params!);
  }

  
}