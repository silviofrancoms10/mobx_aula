import 'package:mobx/mobx.dart';

class Controller {
  var _counter = Observable(0);

  late Action increment;

  Controller() {
    increment = Action(_increment);

  }

  int get counter => _counter.value;
  set counter(int newValue) => _counter.value = newValue;

  _increment() {
    counter++;
  }
}
