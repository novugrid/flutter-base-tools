import 'package:flutter/material.dart';

///A customized bottom appbar
/// project: flutter_base_tools
/// @package: src.custom
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-07-21
// ignore: must_be_immutable
class FCAppBar extends StatefulWidget {
  
  String title;
  TextStyle textStyle;

  FCAppBar({@required this.title, this.textStyle});

  @override
  State<StatefulWidget> createState() {
    return _FCAppBarState();
  }

}

class _FCAppBarState extends State<FCAppBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Divider(color: Colors.black26, height: 1,),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("${widget.title}",
                      style: widget.textStyle ?? TextStyle(
                          fontFamily: "AMedium",
                          color: Color(0xff2B3349)
                      ),
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            height: 40,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              ),
            ),
          ),
        )
      ],
    )
    ;
  }

}