import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';


/// contains handy codethat can be easily used in a statefule widget
/// project: flutter_base_tools
/// @package: src.custom
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-24
///
mixin BaseStatefulWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  String classTag;

  var formKey = GlobalKey<FormState>();
  StreamSubscription errorSub;
  bool alwaysDisplayError = true;
  ValueNotifier<bool> progressNotifier = ValueNotifier(false);
  ValueNotifier<String> errorNotifier = ValueNotifier("");

  initErrorEvent() {
    errorSub = eventBus.on<ErrorEvent>().listen(onErrorEvent);
  }

  onErrorEvent(ErrorEvent event) {
    this.progressNotifier.value = false;
    this.showMessage(event.message);
  }

  showMessage(String message, {bool success = false})
  {
    if(scaffoldKey.currentState != null) {
      scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text("$message"),
            backgroundColor: success ? Colors.black : Colors.red,
          )
      );
    }else{
      print("the scaffoldkey is null, kindly attach the scaffoldkey to the scaffold");
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              "Please Wait...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: 28.0,
                    maxHeight: 28.0,
                    child: Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future showBottomNotification(BuildContext context, {bool success = false, String title, String message}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(title ?? "Information", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: success ? Icon(Icons.check_circle_outline, color: Colors.green, size: 42.0,) : Icon(Icons.error, color: Colors.red.shade200, size: 42.0,),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("${message ?? "oops an error has occured,"
                            " please try again"}",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  navigateTo(BuildContext context, Widget newScreen) async{
    return await Navigator.push(context, CupertinoPageRoute(builder: (context) => newScreen));

  }

  Widget errorWidget() {
    return ValueListenableBuilder(
        valueListenable: errorNotifier,
        builder: (context, String value, child) {
          return value.isEmpty ? SizedBox() :
          Row(
            children: <Widget>[
              Expanded(child: Text("$value",
                style: TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ))
            ],
          );
        }
    );
  }

}