library flutter_base_tools;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_bus/event_bus.dart';

part 'src/Database/SessionManager.dart';
part 'src/observables/Event.dart';

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
