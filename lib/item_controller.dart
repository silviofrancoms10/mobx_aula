import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = _ItemController with _$ItemController;

abstract class _ItemController with Store {
  
  _ItemController(this.titulo);

  final String titulo;

  @observable
  bool marcado = false;

  void alterarMarcado(bool valor) => marcado = valor;

}
