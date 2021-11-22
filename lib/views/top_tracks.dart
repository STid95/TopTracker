import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/artist.dart';
import 'package:top_tracker/models/track.dart';

class TopTracks extends StatefulWidget {
  const TopTracks({Key? key}) : super(key: key);
  static const routeName = "/topTracks";

  @override
  State<StatefulWidget> createState() {
    return _TopTracks();
  }
}

class _TopTracks extends State<TopTracks> {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final List<Track> trackList = arg['tracklist'];
    final Artist artist = arg['artist'];

    final media = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: (trackList.isNotEmpty)
            ? SingleChildScrollView(
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          media * 0.1, media * 0.05, media * 0.1, media * 0.05),
                      child: Expanded(
                        child: Text(
                            "Les 10 morceaux de " +
                                artist.name +
                                " les plus écoutés en France",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      )),
                  for (Track track in trackList) trackDisplay(track, media),
                ]),
              )
            : const Center(
                child: Text(
                "Rien n'a été trouvé...",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              )));
  }

  Widget trackDisplay(Track track, double media) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            media * 0.2, media * 0.05, media * 0.2, media * 0.05),
        child: Column(children: [
          Row(
            children: [
              const Icon(Icons.play_circle_fill, color: Colors.green),
              const SizedBox(width: 5),
              Expanded(
                  child: Text(
                track.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.green),
              const SizedBox(width: 5),
              Text("Popularité : " + track.popularity.toString()),
            ],
          )
        ]));
  }
}
