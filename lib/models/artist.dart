import 'image.dart';

class Artist {
  String id;
  List <Image> image;
  String name;

  Artist(this.id, this.image, this.name);

  Artist.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = ImageList.fromJson(json['images']).imageList,
        name = json['name'];
}

  class ArtistList {
    List <Artist>? artistList;

    ArtistList(this.artistList);

    factory ArtistList.fromJson(List<dynamic> parsedJson) {
      List<Artist> artistList = [];
      for (var element in parsedJson) {
        Artist artist = Artist.fromJson(element);
        artistList.add(artist);
      }

      return ArtistList(
          artistList
      );
    }
  }

class ArtistJson {
  Map <String, dynamic> jsonList;

  ArtistJson(this.jsonList);

  ArtistJson.fromJson(Map<String, dynamic> json)
      : jsonList = json["artists"];
}