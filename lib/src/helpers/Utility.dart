part of flutter_base_tools;

/// created by dammyololade
/// created on 2019-04-27
/// project 
class Utility {

  static bool validateEmail(String value)
  {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static Future<String> getFcmToken() async
  {
    String token = "";
    FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    token = await firebaseMessaging.getToken();
    return token;
  }

  static Mobile splitMobile(String number)
  {
    Mobile mobile;
    if(number.isNotEmpty && number[0] == "+"){
      mobile = Mobile(number.substring(0, 4), number.substring(4, number.length));
    } else {
      mobile = Mobile("", number);
    }
    return mobile;
  }


}

class Mobile{
  String code, phoneNumber;

  Mobile(this.code, this.phoneNumber);

}