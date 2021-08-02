


import 'package:bloc_example/src/core/bloc/bloc_with_state.dart';
import 'package:bloc_example/src/core/params/artwork_request.dart';
import 'package:bloc_example/src/core/resources/data_state.dart';
import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:bloc_example/src/domain/usecases/get_artwork_usecase.dart';
import 'package:equatable/equatable.dart';

part 'remote_artwork_state.dart';

part 'remote_artwork_event.dart';




class RemoteArtworkBloc extends BlocWithState<RemoteArtworkEvent, RemoteArtworkState> {
  final  GetArtworkUseCase _artworkUseCase;
  RemoteArtworkBloc(this._artworkUseCase) : super(const RemoteArtworkLoading());

  final List<Artwork> _artworks = [];
  int _page = 1;
  static const int _pageSize = 20;

  @override
  Stream<RemoteArtworkState> mapEventToState(RemoteArtworkEvent event) async*{
    if(event is GetArtworks) yield*  _getArtworksData(event);
  }

   Stream<RemoteArtworkState> _getArtworksData(RemoteArtworkEvent event) async* {
    yield* runBlocProcess(() async* {
      final dataState = await _artworkUseCase(params: ArtworkRequestParams(page: _page));

      if (dataState is DataSuccess &&  dataState.data!.isNotEmpty){
        final artworks = dataState.data;
        final noMoreData = artworks!.length < _pageSize;
        _artworks.addAll(artworks);
        _page++;

        yield RemoteArtworkDone(_artworks, noMoreData: noMoreData);
      }
      if (dataState is DataFailed) {
        yield RemoteArtworkError(dataState.error);
      }
    });
  }
  
}