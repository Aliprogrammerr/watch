import 'dart:convert';

class User{
final String name ;
final String image ;
final String adress ; 
final String postal_code ;
final String phone;
final String lat; 
final String lng;

User({
    required this.adress,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name , 
    required this.phone,
    required this.postal_code
    
    });

    Map<String ,dynamic> toMap(){
    return {
      "name":name,
      "image":image,
      "adress":adress,
      "postal_code": postal_code,
      "lat":lat,
      "lng":lng,
    };}

    factory User.fromJson(String? jsonString){
      Map<String,dynamic> map =jsonDecode(jsonString!);
      return User(
        adress: map["name"],
        image: map["phone"],
        lat: map["lat"],
        lng: map["lng"],
        name: map["name"],
        phone: map["phone"],
        postal_code: map["p ostal_code"]
        );
    } 

}