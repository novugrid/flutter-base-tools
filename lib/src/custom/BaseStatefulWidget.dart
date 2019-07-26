import 'dart:async';

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
            backgroundColor: success ? Colors.green : Colors.red,
          )
      );
    }else{
      print("the scaffoldkey is null, kindly attach the scaffoldkey to the scaffold");
    }
  }

}