
class HttpResponseValidators {
  static bool isValidStatusCode(int statusCode){
    if(statusCode >= 200 && statusCode < 300){
      return true;
    }else {
      throw HttpExpention(statusCode:statusCode);
    }
  }
}


class HttpExpention implements Exception {
  final int statusCode;
  HttpExpention({required this.statusCode});


 String tostring(){
  String massage;
  switch(statusCode){
  case 400 :
    massage = "bad requset";
    break;
  case 401 : 
    massage = "unAuthorized";
    break;
  case 403 : 
     massage = "forbiden";
     break;

  case 409 :
     massage = "conflict";
     break;
  case 500 :
    massage = "internet server Erro";
    break;

  default:
  massage = "unknown";
  }

   return "HttpExpention : status Code  $statusCode , msg: $massage";



 } 
}