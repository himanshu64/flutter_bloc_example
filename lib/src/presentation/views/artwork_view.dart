import 'package:bloc_example/src/core/bloc/bloc_with_state.dart';
import 'package:bloc_example/src/domain/entities/artwork.dart';
import 'package:bloc_example/src/presentation/widgets/artwork_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../blocs/remote_artworks/remote_artwork_bloc.dart';

class ArtworkView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
    }, [scrollController]);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(scrollController),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        "Artworks",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
  Widget _buildBody(ScrollController scrollController) {
    return BlocBuilder<RemoteArtworkBloc, RemoteArtworkState>(builder: (_, state){
      if(state is RemoteArtworkLoading){
        return const Center(child: CupertinoActivityIndicator());
      }
      if(state is RemoteArtworkError){
        return const Center(child: Icon(Icons.refresh),);
      }
      if(state is RemoteArtworkDone) {
        return _buildArtwork(scrollController, state.artworks!, state.noMoreData!);
      }
      return const SizedBox();
    });
  }
  Widget _buildArtwork(ScrollController scrollController,
      List<Artwork> artworks, bool noMoreData) {
    return ListView(
      controller: scrollController,
      children: [
        ...List<Widget>.from(
          artworks.map(
            (e) => Builder(
              builder: (context) => Artworkidget(
                artwork: e,
                onArticlePressed: (e) => _onArtworkPressed(context, e),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
        print("on scroll");
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteArtworkBloc = BlocProvider.of<RemoteArtworkBloc>(context);
    final state = remoteArtworkBloc.blocProcessState;

    if (currentScroll == maxScroll && state == BlocProcessState.idle) {
      remoteArtworkBloc.add(const GetArtworks());
    }
  }

  void _onArtworkPressed(BuildContext context, Artwork artwork) {
    Navigator.pushNamed(context, '/ArticleDetailsView', arguments: artwork);
  }
}
