import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{ //a utilização do mixin Store é para a geração dos códigos automáticos

  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }

  /* var _counter = Observable(0);

  late Action increment;

  Controller() {
    increment = Action(_increment);

  }

  int get counter => _counter.value;
  set counter(int newValue) => _counter.value = newValue;

  _increment() {
    counter++;
  } */
}
