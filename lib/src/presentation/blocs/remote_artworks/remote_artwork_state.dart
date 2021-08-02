

part of 'remote_artwork_bloc.dart';

abstract class RemoteArtworkState extends Equatable {
  final List<Artwork>? artworks;
  final bool? noMoreData;

  final dynamic? error;

  const RemoteArtworkState({
     this.artworks,
     this.noMoreData,
     this.error,
  });

  @override
  List<dynamic> get props => [artworks, noMoreData, error];
}

class RemoteArtworkLoading extends RemoteArtworkState {
  const RemoteArtworkLoading() ;
}

class RemoteArtworkDone extends RemoteArtworkState {
  const RemoteArtworkDone(List<Artwork> artworks, {bool? noMoreData}) : super(artworks: artworks, noMoreData: noMoreData);
}

class RemoteArtworkError extends RemoteArtworkState {
  const RemoteArtworkError(dynamic error) : super(error: error);
}