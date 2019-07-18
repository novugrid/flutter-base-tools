library flutter_base_tools;

import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

export 'src/custom/BaseStatefulWidget.dart';

export 'src/Database/SessionManager.dart';
export 'src/observables/Event.dart';
export 'src/custom/NovuWidget.dart';
export 'src/helpers/Config.dart';
export 'src/helpers/Utility.dart';
export 'src/helpers/ImageProcessor.dart';
export 'src/model/UploadableImage.dart';
export 'src/model/CrashableModel.dart';
export 'src/animations/PageSlideTransition.dart';
export 'src/model/base_model.dart';
export 'src/model/UserCategories.dart';
export 'src/model/BlocModel.dart';
export 'src/model/GooglePlacesModel.dart';

EventBus eventBus = EventBus();

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  plus() {
    // A new Plus is here
  }
  minus() {
    // this will perform a sub calc
  }

  ///multiply two values
  multiply(int firstValue, int secondValue) => firstValue * secondValue;

  ///divide two values
  division(int firstValue, int secondValue) => firstValue / secondValue;

  //just a lil change

  ///will add more documentations later
}
