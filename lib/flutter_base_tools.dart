library flutter_base_tools;

import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'src/Database/SessionManager.dart';
part 'src/observables/Event.dart';
part 'src/custom/NovuWidget.dart';
part 'src/helpers/AppConfig.dart';
part 'src/helpers/Utility.dart';
part 'src/helpers/ImageProcessor.dart';
part 'src/model/UploadableImage.dart';
part 'src/model/CrashableModel.dart';

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
