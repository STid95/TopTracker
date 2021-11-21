import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_tracker/models/Artist.dart';
import 'package:top_tracker/services/getArtistId.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    TextEditingController artistController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("TopTracker"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Entrez un artiste"),
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
                      if (_formKey.currentState!.validate()) {
                        List <Artist> list = await getArtistId(
                            artistController.text);
                        Navigator.pushNamed(context, "/chooseArtist", arguments: list);
                      }
                    },
                    child: const Text("Voir les top tracks")))
          ],
        )));
  }
}
