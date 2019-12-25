
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base_tools/flutter_base_tools.dart';
import 'package:flutter_base_tools/src/helpers/Config.dart';
import 'package:flutter_base_tools/src/observables/Event.dart';
import 'package:image_picker/image_picker.dart';

///
/// project: flutter_base_tools
/// @package: src.helpers
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-04
class ImageProcessor {

  Future<ImagePickerModel> getImage(ImageSource imageSource) async {
    ImagePickerModel model = ImagePickerModel(success: false);
    try{
      model.file = await ImagePicker.pickImage(source: imageSource);
      if(model.file != null) model.success = true;
    } catch(error) {
      model.message = error.toString();
    }
    return model;
  }

  showModal(BuildContext context, String title)
  {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) =>
            Card(
              margin: EdgeInsets.all(.0),
              child: Container(
                //color: Colors.red.shade50,
                height: 150,
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: <Widget>[
                    new Text(
                      title,
                      style: TextStyle(fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Config.APP_PRIMARY_COLOR),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      height: 10.0,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        new InkWell(
                          onTap: (){
                            eventBus.fire(ImageSourceSelectedEvent(ImageSource.camera));
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Config.APP_BOX_COLOR,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                ClipOval(
                                  child: new Container(
                                      padding: EdgeInsets.all(6.0),
                                      child: new Icon(
                                        Icons.camera_alt,
                                        size: 22.0,
                                        color: Config.APP_PRIMARY_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: 7.0,
                                ),
                                Text(
                                  "CAMERA",
                                  style: TextStyle(
                                      color: Config.APP_PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        new InkWell(
                          onTap: (){
                            eventBus.fire(ImageSourceSelectedEvent(ImageSource.gallery));
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                            decoration: BoxDecoration(
                              color: Config.APP_BOX_COLOR,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: new Column(
                              children: <Widget>[
                                ClipOval(
                                  child: new Container(
                                      padding: EdgeInsets.all(6.0),
                                      child: new Icon(
                                        Icons.image,
                                        size: 22.0,
                                        color: Config.APP_PRIMARY_COLOR,
                                      )),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "GALLERY",
                                  style: TextStyle(
                                      color: Config.APP_PRIMARY_COLOR,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
    );
  }
}