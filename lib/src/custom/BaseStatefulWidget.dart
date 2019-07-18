import 'package:flutter/material.dart';


/// contains handy codethat can be easily used in a statefule widget
/// project: flutter_base_tools
/// @package: src.custom
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-24
///
mixin BaseStatefulWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();

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