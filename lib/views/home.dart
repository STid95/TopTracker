import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/artist.dart';
import 'package:top_tracker/services/get_artists.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController artistController = TextEditingController();
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: media.size.width * 0.7,
              child: const Text(
                "Entrez un artiste pour découvrir ses 10 morceaux les plus écoutés sur Spotify",
                maxLines: 2,
              ),
            ),
            SizedBox(
                width: media.size.width * 0.7,
                child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: true,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      maxLines: 2,
                      controller: artistController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un nom';
                        }
                        return null;
                      },
                    ))),
            Padding(
                padding: EdgeInsets.only(top: media.size.height * 0.07),
                child: ElevatedButton(
                    onPressed: () async {
                        List<Artist>? list =
                            await getArtists(artistController.text);
                        if (list != null) {
                          Navigator.pushNamed(context, "/chooseArtist",
                              arguments: list);
                        } else {
                          const Text("L'artiste est introuvable");
                        }
                      },
                    child: const Text("Voir les top tracks")))
          ],
        )));
  }
}
