import 'package:http/http.dart' as http;
import 'package:spotify_sdk/spotify_sdk.dart';


Future<http.Response> getArtistId(String artist) async {

  await SpotifySdk.connectToSpotifyRemote(clientId: "bcf45f6bdb06417eafcb9c1e1de7c388", redirectUrl: "https://github.com/STid95");
  String authenticationToken = await SpotifySdk.getAuthenticationToken(clientId: "bcf45f6bdb06417eafcb9c1e1de7c388", redirectUrl: "http://www.google.com");

  final response = await http.get(
    Uri.parse('https://api.spotify.com/v1/search?q=' +
        artist.trim().toLowerCase() +
        'type=artist'),
    headers: {
          "Content-Type": "application/json", "Accept": "application/json",
          "Authorization": "Bearer" + authenticationToken
    },
  );
  print(response.body);
  return response;
}
