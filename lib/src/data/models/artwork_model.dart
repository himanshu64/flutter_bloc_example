import 'package:bloc_example/src/domain/entities/artwork.dart';

class ArtworkModel extends Artwork {
  const ArtworkModel(
      {required int id,
      required String publicationHistory,

       String? imageId,
      required String mediumDisplay,
      required String title,
      required String artistDisplay})
      : super(
            id: id,
            publicationHistory: publicationHistory,
           
            mediumDisplay: mediumDisplay,
            title: title,
            artistDisplay: artistDisplay);

  factory ArtworkModel.fromJson(Map<String, dynamic> map) {
    return ArtworkModel(
      artistDisplay: map['artist_display'] as String,
      title: map['title'] as String,
      id: map['id'] as int,
      imageId: map['image_id'] != null ? map['image_id'] as String: "",
      mediumDisplay: map['medium_display'] as String,

      publicationHistory: map['publication_history'] != null ? map['publication_history'] as String : "",
    );
  }
}
