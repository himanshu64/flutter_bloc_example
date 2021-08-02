import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:flutter/material.dart';

class ArtworkDetailView extends StatelessWidget {
  final Artwork artwork;
  const ArtworkDetailView({Key? key, required this.artwork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        title: const Text("Artwork",style: TextStyle(color: Colors.black)),
      
      ),
      body: _buildBody(),
    );
  }
    Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          
          _buildArtworkImage(),
         _buildArtworkTitle(),
        ],
      ),
    );
  }

  Widget _buildArtworkTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const SizedBox(height: 50.0,),
          Text(
            artwork.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 50.0,),
          Text(
            artwork.artistDisplay,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }

  Widget _buildArtworkImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.asset("assets/ex.jpeg", fit: BoxFit.cover),
    );
  }
}
