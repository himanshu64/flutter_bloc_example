import 'package:bloc_example/src/data/models/artwork_model.dart';

class AllArtworkResponseModel {
  final int totalResults;
  final List<ArtworkModel> artworks;

  AllArtworkResponseModel({
    required this.totalResults,
    required this.artworks,
  });
  factory AllArtworkResponseModel.fromJson(Map<String, dynamic> json) {
    return AllArtworkResponseModel(
        totalResults: json['pagination']['total'] as int,
        artworks: List<ArtworkModel>.from((json['data'] as List<dynamic>)
            .map((e) => ArtworkModel.fromJson(e as Map<String, dynamic>))));
  }
}
