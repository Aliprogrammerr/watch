 

class Banner {
  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updateAt;

  Banner({required this.createdAt,
  required this.id , 
  required this.image,
  required this.title,required this.updateAt});


  factory Banner.fromJson(Map<String ,dynamic> json){
    return Banner(
      id: json["id"] as int,
      image: json["image"] as String,
      title: json["title"] as String,
      createdAt: DateTime.parse(json["created_at"]),
      updateAt:DateTime.parse( json["update_at"]));
  }

  Map<String,dynamic> tojson(){
    final Map<String ,dynamic> data = <String,dynamic>{};
    data["id"]=id;
    data["title"]=title;
    data["image"] = image;
    data["creted_at"]= createdAt.toIso8601String();
    data["updated_at"]=updateAt.toIso8601String();
    return data;
  }
}