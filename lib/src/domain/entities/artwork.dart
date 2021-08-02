import 'package:equatable/equatable.dart';

class Artwork extends Equatable{
  final int id;
  final String title;
  final String artistDisplay;

  final String mediumDisplay;
  final String publicationHistory;
  final String? imageId;

  const Artwork(
      {required this.id,
      required this.title,
      required this.artistDisplay,
      
      required this.mediumDisplay,
      required this.publicationHistory,
       this.imageId});

  @override
  List<Object?> get props => [
    id,
    title,
    artistDisplay,
    mediumDisplay,
    publicationHistory,
    imageId
  ];
  @override
  bool get stringify => true;
}