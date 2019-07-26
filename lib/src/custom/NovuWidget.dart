import 'package:flutter/material.dart';
import 'package:flutter_base_tools/src/helpers/Config.dart';

typedef TextValidator = Function(String value);

class NovuWidgets
{

  static titleStyle()
  {
    return TextStyle(
      color: Config.APP_PRIMARY_COLOR,
      fontSize: 25,
      fontWeight: FontWeight.w600
    );
  }

  static Widget FormTextField(String label, String hint, TextEditingController _controller,
      TextInputType inputType, String errorMessage, {bool isObscureText = false, Color borderColor, TextValidator textValidator,
        bool isLastTextField = false, FocusNode focusNode, FocusNode nextFocusNode,
        BuildContext context, TextStyle labelTextStyle, String prefixText = "", bool hasBorder = true,
        TextStyle hintStyle, TextStyle inputStyle = const TextStyle(color: Colors.black), EdgeInsets contentPadding = const EdgeInsets.all(5)
      })
  {
    return Center(
      child: Column(
        children: <Widget>[
          label.isEmpty ? SizedBox() :
          Row(
            children: <Widget>[
              Text(label, style: labelTextStyle ?? TextStyle(color: Color(0xFF716D73), fontSize: 15, fontWeight: FontWeight.w500),)
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: hintStyle ?? TextStyle(
                  color: Color(0XFF757575),
                  fontSize: 13
              ),
              errorStyle: TextStyle(color: Colors.red, fontSize: 10),
              border: !hasBorder ? InputBorder.none : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black26,
                      width: 1
                  )
              ),
              enabledBorder: !hasBorder ? InputBorder.none : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? Colors.black26,
                      width: 1
                  )
              ),
              contentPadding: contentPadding,
              prefixText: prefixText,
            ),
            controller: _controller,
            maxLines: 1,
            enabled: true,
            keyboardType: inputType,
            obscureText: isObscureText ?? false,
            textInputAction: isLastTextField ? TextInputAction.done : TextInputAction.next,
            validator: textValidator ?? (value) {
              if(value.isEmpty) {
                return errorMessage;
              }
            },
            focusNode: focusNode,
            onFieldSubmitted: (term){
              if(focusNode != null && context != null){
                isLastTextField ? FocusScope.of(context).consumeKeyboardToken()
                    : FocusScope.of(context).requestFocus(nextFocusNode);
              }
            },
            style: inputStyle,
          ),
        ],
      ),
    );
  }

  static Widget negativeButton( String title, VoidCallback callback,
      {bool shouldPop = false, Color textColor, TextStyle textStyle, Widget trailingWidget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            callback != null
                ? callback()
                : print('Negative Callback Not Present');
          },
          child: Text(title, style: TextStyle(fontSize: 14.0)),
          textColor: textColor ?? Config.APP_PRIMARY_COLOR,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0)),
        ),
      ],
    );
  }

  static Widget inputCard(Widget child, {
    bool validated, IconData icon, bool showValidationIcon = false})
  {
    return Card(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.grey, size: 20,),

            SizedBox(width: 5,),

            Expanded(child: child),

            SizedBox(width: showValidationIcon ? 5 : 0,),

            !showValidationIcon ? SizedBox() :
            Icon(Icons.done, size: 20, color: validated ? Colors.green : Colors.grey,),
          ],
        ),
      ),
    );
  }

  static Widget SearchField(TextEditingController controller,{bool hasBorder = false, Color borderColor})
  {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(
            color: Color(0XFF757575),
            fontSize: 13
        ),
        border: !hasBorder ? InputBorder.none : UnderlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? Colors.black26,
                width: 1
            )
        ),
        enabledBorder: !hasBorder ? InputBorder.none : UnderlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? Colors.black26,
                width: 1
            )
        ),
        contentPadding: EdgeInsets.all(4),
      ),
      controller: controller,
      maxLines: 1,
      enabled: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (term){

      },
      style: TextStyle(
        color: Colors.black,
      ),
    );
  }

  static Widget positiveButton(String title, VoidCallback callback,
      {Color bgColor,
        Color textColor,
        int width = 180,
        double elevation = 3.0}) {
    return RaisedButton(
      onPressed: () {
        callback != null ? callback() : print('Positive Callback Not Present');
      },
      color: bgColor ?? Config.APP_ACCENT_COLOR,
      textColor: Colors.white,
      padding: new EdgeInsets.symmetric(vertical: 12),
      elevation: elevation,
      child: Row(
        children: <Widget>[
          Expanded(
            child: new Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    );
  }

  static appBar(String title, {List<Widget> actions, double elevation = 3})
  {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text("$title", style: TextStyle(color: Config.APP_PRIMARY_COLOR),),
      toolbarOpacity: 0.5,
      iconTheme: IconThemeData(color: Config.APP_PRIMARY_COLOR),
      actions: actions,
      elevation: elevation,
    );
  }

  static Widget pageLoading(BuildContext context)
  {
    return Container(
      color: Colors.black45,
      height: MediaQuery.of(context).size.height,
      child: Center(child: CircularProgressIndicator()),
    );
  }

  static Widget signUpTextField(String hint, TextEditingController _controller,
      {bool isObscureText = false,
        FocusNode focusNode,
        FocusNode nextFocusNode,
        BuildContext context,
        TextInputType inputType = TextInputType.text,
        TextValidator textValidator,
        bool isLastTextField = false, String errorMessage}) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "ARoman",
          fontSize: 16,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 16),
      ),
      controller: _controller,
      maxLines: 1,
      enabled: true,
      keyboardType: inputType,
      obscureText: isObscureText ?? false,
      focusNode: focusNode,
      textInputAction:
      isLastTextField ? TextInputAction.done : TextInputAction.next,
      onFieldSubmitted: (term) {
        if (focusNode != null && context != null) {
          isLastTextField
              ? FocusScope.of(context).consumeKeyboardToken()
              : FocusScope.of(context).requestFocus(nextFocusNode);
        }
      },
      style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: "ARoman"),
      // ignore: missing_return
      validator: textValidator ?? (value) {
        if(value.isEmpty) {
          return errorMessage ?? "Fill the form";
        }
      },
    );
  }

  static Widget progressAwareButton({@required ValueNotifier<bool> notifier, @required Widget child}) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, value, anotherChild){
        return value ? Center(child: CircularProgressIndicator(),) : child;
      }
    );
  }

  static Widget divider({
    Color color = Colors.black26,
    double height = 0.5
  }) => Container(
    height: height,
    color: color,
  );

  static Widget neutralButton( String title, VoidCallback callback,
      {Color textColor, TextStyle textStyle, Widget trailingWidget}) {
    return FlatButton(
      onPressed: () {
        callback != null
            ? callback()
            : print('Negative Callback Not Present');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(title, style: textStyle ?? TextStyle(
                fontSize: 14.0,
                color: Color(0xff2B3349),
              fontWeight: FontWeight.bold
            )
            )),
            trailingWidget ?? SizedBox(),
          ],
        ),
      ),
      textColor: textColor ?? Config.APP_PRIMARY_COLOR,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(1.0)),
    );
  }


}