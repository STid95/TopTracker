import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_tracker/models/Track.dart';

import 'connectToSpotify.dart';


Future<List <Track>?>? getArtistTopTracks(String id) async {

  var authenticationToken = await connectToSpotify();

  if (authenticationToken != null) {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/artists/' +
          id +
          '/top-tracks?market=FR'),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer " + authenticationToken
      },
    );
    final parsed = jsonDecode(response.body);
    var jsonList = TrackJson.fromJson(parsed).jsonList;
    var trackList = TrackList.fromJson(jsonList).trackList;
    return trackList;
  }
  return null;
}