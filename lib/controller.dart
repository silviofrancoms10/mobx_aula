import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  //a utilização do mixin Store é para a geração dos códigos automáticos

  ControllerBase() {
    autorun((_) {
      //Executa sempre que um observable tem seu estado alterado
      print(email);
      print(senha);
      print(login);
    });
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  void setEmail(value) => email = value;

  @action
  void setSenha(value) => senha = value;

  @computed
  String get login => "$email - $senha";

  @computed
  bool get formValidado => email.length >= 5 && senha.length >= 5;

  /* @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  } */

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
