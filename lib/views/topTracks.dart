import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/Track.dart';

class TopTracks extends StatefulWidget {
  const TopTracks({Key? key}) : super(key: key);
  static const routeName = "/topTracks";

  @override
  State<StatefulWidget> createState() {
    return _TopTracks();
  }
}

class _TopTracks extends State<TopTracks> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final List<Track> trackList =
        ModalRoute.of(context)!.settings.arguments as List<Track>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [for (Track track in trackList)
              Text (track.name)],
          ),
        ));
  }
}
