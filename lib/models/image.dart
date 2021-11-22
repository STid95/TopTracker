class Image {
  String url;

  Image(this.url);

  Image.fromJson(Map<String, dynamic> json) : url = json['url'];
}

class ImageList {
  List<Image> imageList;

  ImageList(this.imageList);

  factory ImageList.fromJson(List<dynamic> parsedJson) {
    List<Image> imageList = [];
    for (var element in parsedJson) {
      Image image = Image.fromJson(element);
      imageList.add(image);
    }

    return ImageList(imageList);
  }
}
