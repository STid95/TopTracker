import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:top_tracker/models/Artist.dart';


Future<List <Artist>> getArtistId(String artist) async {

  await SpotifySdk.connectToSpotifyRemote(clientId: "bcf45f6bdb06417eafcb9c1e1de7c388", redirectUrl: "https://github.com/STid95");
  String authenticationToken = await SpotifySdk.getAuthenticationToken(clientId: "bcf45f6bdb06417eafcb9c1e1de7c388", redirectUrl: "https://github.com/STid95");
  print ("Token :" + authenticationToken);

  final response = await http.get(
    Uri.parse('https://api.spotify.com/v1/search?q=' +
        artist.trim().toLowerCase() +
        '&type=artist&limit=5'),
    headers: {
          "Content-Type": "application/json", "Accept": "application/json",
          "Authorization": "Bearer " + authenticationToken
    },
  );
  print(response.body);
  final parsed = jsonDecode(response.body);
  Map <String, dynamic> artistJson = ArtistJson.fromJson(parsed).jsonList;
  var artistList = ArtistList.fromJson(artistJson['items']).artistList;
  print (artistList);
  return artistList;
}
