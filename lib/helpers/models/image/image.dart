class Image {
  late String images;
  Image.fromJson(Map<String, dynamic> map) {
    this.images = map['images'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'images': this.images
    };
  }
  

}
