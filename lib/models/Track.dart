
class Track {
  String name;
  int popularity;
  String url;

  Track(this.name, this.popularity, this.url);

  Track.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        popularity = json['popularity'],
        url = json['preview_url'];
}

class TrackList {
  List <Track>? trackList;

  TrackList(this.trackList);

  factory TrackList.fromJson(List<dynamic> parsedJson) {
    List<Track> trackList = [];
    parsedJson.forEach((element) {
      Track track = Track.fromJson(element);
      trackList.add(track);
    });

    return new TrackList(
        trackList
    );
  }
}

class TrackJson {
  List <dynamic> jsonList;

  TrackJson(this.jsonList);

  TrackJson.fromJson(Map<String, dynamic> json)
      : jsonList = json["tracks"];
}