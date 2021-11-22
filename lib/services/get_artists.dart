import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_tracker/models/artist.dart';
import 'package:top_tracker/services/connect_to_spotify.dart';

// Fetch the artists corresponding to the user wrote

Future<List<Artist>?> getArtists(String artist) async {
  var authenticationToken = await connectToSpotify();

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
  final parsed = jsonDecode(response.body);
  Map<String, dynamic> artistJson = ArtistJson.fromJson(parsed).jsonList;
  var artistList = ArtistList.fromJson(artistJson['items']).artistList;
  return artistList;
}
