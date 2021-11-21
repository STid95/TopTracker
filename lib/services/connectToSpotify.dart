
import 'package:spotify_sdk/spotify_sdk.dart';

Future<String> connectToSpotify() async {
  await SpotifySdk.connectToSpotifyRemote(
      clientId: "bcf45f6bdb06417eafcb9c1e1de7c388",
      redirectUrl: "https://github.com/STid95");
  String authenticationToken = await SpotifySdk.getAuthenticationToken(
      clientId: "bcf45f6bdb06417eafcb9c1e1de7c388",
      redirectUrl: "https://github.com/STid95");
  return authenticationToken;
}
