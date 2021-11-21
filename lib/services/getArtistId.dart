import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_tracker/models/Artist.dart';
import 'package:top_tracker/services/connectToSpotify.dart';

Future<List<Artist>?> getArtistId(String artist) async {
  var authenticationToken = await connectToSpotify();

  if (authenticationToken != null) {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/search?q=' +
          artist.trim().toLowerCase() +
          '&type=artist&limit=6'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer " + authenticationToken
      },
    );
    print(response.body);
    final parsed = jsonDecode(response.body);
    Map<String, dynamic> artistJson = ArtistJson.fromJson(parsed).jsonList;
    var artistList = ArtistList.fromJson(artistJson['items']).artistList;
    print(artistList);
    return artistList;
  }
  return null;
}
