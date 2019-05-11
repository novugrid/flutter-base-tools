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
  ///For getting the widgetrelative position on a widget tree
  ///returns [RelativeRect] the position of the widget
  ///
  static RelativeRect getWidgetPositionOnScreen(BuildContext context, GlobalKey widgetKey)
  {
    final RenderBox popUpRenderBox = widgetKey.currentContext.findRenderObject();
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        popUpRenderBox.localToGlobal(popUpRenderBox.size.bottomRight(Offset.zero), ancestor: overlay),
        popUpRenderBox.localToGlobal(popUpRenderBox.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    return position;
  }

  static String getDuration(Duration d) {
    if (d.inSeconds <= 60) {
      return '${d.inSeconds.toString()} second${d.inSeconds != 1 ? 's' : ''} ago';
    } else if (d.inMinutes <= 60) {
      return '${d.inMinutes.toString()} minute${d.inMinutes != 1 ? 's' : ''} ago';
    } else if (d.inHours <= 24) {
      return '${d.inHours.toString()} hour${d.inHours != 1 ? 's' : ''} ago';
    } else if (d.inDays <= 7) {
      return '${d.inDays.toString()} day${d.inDays != 1 ? 's' : ''} ago';
    }
    return 'N/A';
  }


}

class Mobile{
  String code, phoneNumber;

  Mobile(this.code, this.phoneNumber);

}