import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/Artist.dart';
import 'package:top_tracker/models/Track.dart';
import 'package:top_tracker/services/getArtistTopTracks.dart';

class ChooseArtist extends StatefulWidget {
  const ChooseArtist({Key? key}) : super(key: key);
  static const routeName = "/chooseArtist";

  @override
  State<StatefulWidget> createState() {
    return _ChooseArtist();
  }
}

class _ChooseArtist extends State<ChooseArtist> {
  @override
  Widget build(BuildContext context) {

    final List<Artist> artistList =
        ModalRoute.of(context)!.settings.arguments as List<Artist>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              for (Artist artist in artistList)
                GestureDetector(
                  onTap: () async {
                    List <Track>? trackList = await getArtistTopTracks(
                        artist.id);
                    if (trackList != null) {
                      Navigator.pushNamed(context, "/topTracks",
                          arguments: trackList);
                    } else {
                      Text("Aucun titre n'a été trouvé");
                    }
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(child: Image.network(artist.image.first.url)),
                        Text(artist.name),
                      ],
                    ),
                  ),
                )
            ]));
  }
}
