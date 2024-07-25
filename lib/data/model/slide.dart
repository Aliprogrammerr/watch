class Slide {
  Slide({required this.id, required this.image, required this.title});
  int id;
  String title;
  String image;

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
        id: json["id"] as int,
        image: json["image"] as String,
        title: json["title"] as String);
  }
}
