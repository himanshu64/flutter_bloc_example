import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:flutter/material.dart';

class Artworkidget extends StatelessWidget {
  final Artwork artwork;
  final void Function(Artwork artwork) onArticlePressed;

  const Artworkidget({
    Key? key,
    required this.artwork,
    required this.onArticlePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Card(
        elevation: 50,
        shadowColor: Colors.white,
        color: Colors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: Column(
            children: [
              Container(
                height: 180.0,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/ex.jpeg",
                  fit: BoxFit.cover,
                ),
              ), //CirclAvatar
              const SizedBox(
                height: 10,
              ), //SizedBox
              Text(
                artwork.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
              // const Text(
              //   'GeeksforGeeks is a computer science portal
              //   for geeks at geeksforgeeks.org. It contains
              //   well written, well thought and well explained
              //   computer science and programming articles,
              //   quizzes, projects, interview experienxes
              //   and much more!!',
              //   style: TextStyle(
              //     fontSize: 15,
              //     color: Colors.green[900],
              //   ), //Textstyle
              // ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
            ],
          ), //Padding
        ), //SizedBox
      ), //Card,
    );
  }

  Widget _buildImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
          ),
          child: Image.network(
            "https://www.artic.edu/iiif/2/${artwork.imageId}/843,/0/default.jpg",
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return const Center(
                child: Text(
                  '404\nNOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              artwork.title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // // Description
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 4),
            //     child: Text(
            //       article.description ?? '',
            //       maxLines: 2,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed(artwork);
    }
  }
}
