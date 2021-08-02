part of 'remote_artwork_bloc.dart';



abstract class RemoteArtworkEvent extends Equatable {
  const RemoteArtworkEvent();

  @override
  List<Object> get props => [];
}

class GetArtworks extends  RemoteArtworkEvent{
  const GetArtworks();
}