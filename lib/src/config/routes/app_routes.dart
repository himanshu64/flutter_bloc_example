import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:bloc_example/src/presentation/views/artwork_detail_view.dart';
import 'package:bloc_example/src/presentation/views/artwork_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case  '/' :
        return _materialRoute( ArtworkView());

        case '/ArticleDetailsView':
        return _materialRoute(ArtworkDetailView(artwork: settings.arguments as Artwork));
        
       
      default: return _materialRoute(const Scaffold());
    }
  }
  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}