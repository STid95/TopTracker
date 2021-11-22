import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/artist.dart';
import 'package:top_tracker/models/track.dart';
import 'package:top_tracker/services/get_artist_top_tracks.dart';

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
        body: (artistList.isNotEmpty)
            ? GridView.count(
                primary: false,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                    for (Artist artist in artistList)
                      GestureDetector(
                        onTap: () async {
                          List<Track>? trackList =
                              await getArtistTopTracks(artist.id);
                          if (trackList != null) {
                            Navigator.pushNamed(context, "/topTracks",
                                arguments: {
                                  'tracklist': trackList,
                                  'artist': artist
                                });
                          } else {
                            const Text("Aucun titre n'a été trouvé");
                          }
                        },
                        child: Card(
                          child: Column(
                            children: [
                              (artist.image.isNotEmpty)
                                  ? Expanded(
                                      child:
                                          Image.network(artist.image.first.url))
                                  : Expanded(
                                      child: Image.asset(
                                          'assets/images/questionMark.png')),
                              Text(artist.name),
                            ],
                          ),
                        ),
                      )
                  ])
            : const Center(
                child: Text(
                "Rien n'a été trouvé...",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )));
  }
}
