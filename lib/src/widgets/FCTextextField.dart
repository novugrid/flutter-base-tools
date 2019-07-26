import 'package:flutter/material.dart';

///A custom textfield that overirdes the original Textfrom field
/// project: flutter_base_tools
/// @package: src.widgets
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-07-21

typedef FCTextValidator = Function(String value);

// ignore: must_be_immutable
class FCTextField extends StatefulWidget {

  String label, hint, errorMessage;
  TextEditingController controller;
  TextInputType inputType;
  bool isObscureText = false;
  Color borderColor;
  FCTextValidator textValidator;
  bool isLastTextField = false;
  FocusNode focusNode, nextFocusNode;
  BuildContext context;
  TextStyle labelTextStyle;
  String prefixText = "";
  bool hasBorder = true;
  TextStyle hintStyle, inputStyle;
  EdgeInsets contentPadding;
  ///A widget positioned at the the end of the textField
  Widget trailingWidget;
  /// The parent widget for the textfield
  Widget container;


  FCTextField({
    @required this.label,
    @required this.controller,
    this.hint,
    this.errorMessage,
    this.inputType,
    this.isObscureText = false,
    this.borderColor,
    this.textValidator,
    this.isLastTextField = false,
    this.focusNode,
    this.nextFocusNode,
    this.context,
    this.labelTextStyle,
    this.prefixText,
    this.hasBorder = false,
    this.hintStyle,
    this.inputStyle,
    this.contentPadding,
    this.trailingWidget = const SizedBox(),
  });

  @override
  State<StatefulWidget> createState() {
    return _FCTextFieldState(
    this.label,
    this.controller,
    this.hint,
    this.errorMessage,
    this.inputType,
    this.isObscureText,
    this.borderColor,
    this.textValidator,
    this.isLastTextField,
    this.focusNode,
    this.nextFocusNode,
    this.labelTextStyle,
    this.prefixText,
    this.hasBorder,
    this.hintStyle,
    this.inputStyle,
    this.contentPadding,
    this.trailingWidget
    );
  }

}

class _FCTextFieldState extends State<FCTextField> {

  String label, hint, errorMessage;
  TextEditingController controller;
  TextInputType inputType;
  bool isObscureText;
  Color borderColor;
  FCTextValidator textValidator;
  bool isLastTextField;
  FocusNode focusNode, nextFocusNode;
  TextStyle labelTextStyle;
  String prefixText = "";
  bool hasBorder;
  TextStyle hintStyle, inputStyle;
  EdgeInsets contentPadding;
  ///A widget positioned at the the end of the textField
  Widget trailingWidget;

  TextStyle fcStyle = TextStyle(
      fontFamily: "AHeavy",
      fontSize: 13,
      color: Color(0xff786FA6)
  );


  _FCTextFieldState(this.label, this.controller, this.hint, this.errorMessage,
      this.inputType, this.isObscureText, this.borderColor, this.textValidator,
      this.isLastTextField, this.focusNode, this.nextFocusNode,
      this.labelTextStyle, this.prefixText, this.hasBorder, this.hintStyle,
      this.inputStyle, this.contentPadding, this.trailingWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff7AEFF3F6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: hintStyle ?? TextStyle(
                          fontFamily: "AHeavy",
                          fontSize: 13,
                          color: Color(0xffB52B3349)
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                      prefix: prefixText != null ? Text("$prefixText", style: fcStyle,) : SizedBox()
                    ),
                    controller: controller,
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
                    style: inputStyle ?? TextStyle(
                        fontFamily: "AHeavy",
                        fontSize: 13,
                        color: Color(0xffB52B3349)
                    ),
                    // ignore: missing_return
                    validator: textValidator ?? (value) {
                      if(value.isEmpty) {
                        return errorMessage ?? "Fill the form";
                      }
                    },
                  ),
                  
                  SizedBox(height: 5,),

                  Text("${label}",
                    style: labelTextStyle ?? fcStyle,
                  )
                ],
              )
          ),

          trailingWidget ?? SizedBox()
        ],
      ),
    );
  }

}