import 'package:mobx/mobx.dart';
import 'package:mobx_aula/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = _PrincipalController with _$PrincipalController;

abstract class _PrincipalController with Store {
  
  @observable
  String novoItem = '';

  @action
  void setNovoItem(String value) => novoItem = value;

  ObservableList<ItemController> listaItens = ObservableList<ItemController>();

  @action
  void adicionarItem() {
    listaItens.add(ItemController(novoItem));
  }
}