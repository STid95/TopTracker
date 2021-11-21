import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/Artist.dart';

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
    final List <Artist> artistList = ModalRoute.of(context)!.settings.arguments as List <Artist>;

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: Center(
          child: Column (
            children: [
              for (Artist artist in artistList)
                GestureDetector(
                  onTap: () => print (artist.id),
                  child: Text (artist.name),
                )
            ],
          )


            ));
  }
}
