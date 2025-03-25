import 'package:mobx/mobx.dart';
part 'principal_controller.g.dart';

class PrincipalController = _PrincipalController with _$PrincipalController;

abstract class _PrincipalController with Store {
  
  @observable
  String novoItem = '';

  @action
  void setNovoItem(String value) => novoItem = value;

  ObservableList<String> listaItens = ObservableList();

  @action
  void adicionarItem() {
    listaItens.add(novoItem);
  }
}