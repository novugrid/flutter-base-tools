

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


/// created by dammyololade
/// created on 2019-04-27
/// project 
class Utility {

  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static bool isValidEmail(String email)
  {
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }

  static String validateEmail(String value)
  {
    RegExp regExp = RegExp(emailPattern);
    if(!regExp.hasMatch(value.trim())) {
      return "Enter valid email";
    } else {
      return null;
    }
  }

  static Future<String> getFcmToken() async
  {
    String token = "";
   //FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    //token = await firebaseMessaging.getToken();
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

  static String getDuration(Duration d, {bool includeAgo = true}) {
    if (d.inSeconds <= 60) {
      return '${d.inSeconds.toString()} second${d.inSeconds != 1 ? 's' : ''} ${includeAgo ? "ago" : ""}';
    } else if (d.inMinutes <= 60) {
      return '${d.inMinutes.toString()} minute${d.inMinutes != 1 ? 's' : ''} ${includeAgo ? "ago" : ""}';
    } else if (d.inHours <= 24) {
      return '${d.inHours.toString()} hour${d.inHours != 1 ? 's' : ''} ${includeAgo ? "ago" : ""}';
    }
    return '${d.inDays.toString()} day${d.inDays != 1 ? 's' : ''} ${includeAgo ? "ago" : ""}';
  }

  static String getFutureDuration(Duration d) {
    if(d.inSeconds <= 60) {
      return "${d.inSeconds} second${d.inSeconds != 1 ? 's' : ''}";
    }
  }

  static String readableDate(DateTime date) {
    return "${date.day < 10 ? "0${date.day}" : "${date.day}"}-"
        "${date.month < 10 ? "0${date.month}" : "${date.month}"}-"
        "${date.year}";
  }

  static String extractFirstLetter(String s) {
    s = s ?? '';
    if (s == null || s.isEmpty) {
      return '';
    }

    if (s.split(' ').length > 1) {
      StringBuffer stringBuffer = new StringBuffer();
      s.split(' ').forEach((s) {
        if (s == null || s.isEmpty) {
          stringBuffer.write('');
        } else {
          stringBuffer.write(s.substring(0, 1).toUpperCase());
        }
      });

      return stringBuffer.toString();
    }
    return s.substring(0, 1);
  }

  static String extractErrorMessageFromResponse(Response response) {
    String message = "";
    try {
      if (response?.data != null && response.data["message"] != null) {
        message = response.data["message"];
      } else {
        message = response.statusMessage;
      }
    } catch (error, stackTrace) {
      message = response?.statusMessage ?? error.toString();
    }
    return message;
  }

}

class Mobile{
  String code, phoneNumber;

  Mobile(this.code, this.phoneNumber);

}