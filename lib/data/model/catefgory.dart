
class Category {
  Category({required this.id, required this.image, required this.title});
  int id;
  String title;
  String image;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json["id"] as int,
        image: json["image"] as String,
        title: json["title"] as String);
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data["id"]= ["id"];
    data["title"]=["title"];
    data["image"]=["image"];
    return data; 
  }
} 
