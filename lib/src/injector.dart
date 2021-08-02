import 'package:bloc_example/src/data/datasources/remote/artwork_api_service.dart';
import 'package:bloc_example/src/data/repositories/artwork_repository_impl.dart';
import 'package:bloc_example/src/domain/repositories/artwork_repository.dart';
import 'package:bloc_example/src/domain/usecases/get_artwork_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import './presentation/blocs/remote_artworks/remote_artwork_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  injector.registerSingleton<Dio>(Dio());
  injector.registerSingleton<ArtworkApiService>(ArtworkApiService(injector()));
  injector.registerSingleton<ArtworkRepository>(ArtworkRepositoryImpl(injector()));
  injector.registerSingleton<GetArtworkUseCase>(GetArtworkUseCase(injector()));
  injector.registerSingleton<RemoteArtworkBloc>(RemoteArtworkBloc(injector()));
}