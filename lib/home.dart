import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_aula/controller.dart';
import 'package:mobx_aula/principal.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();
  late ReactionDisposer reactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /* autorun((_) {
      print(controller.formValidado);
    }); */

    controller = Provider.of<Controller>(context);

    reactionDisposer = reaction((_) => controller.usuarioLogado, (
      usuarioLogado,
    ) {
      if (usuarioLogado) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => Principal(),
          ), // quando loga esta mudando para outra tela
        );
      }
    });
  }

  @override
  void dispose() {
    reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            /* Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(
                    "${controller.counter}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ), */
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "e-mail"),
                onChanged: controller.setEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(labelText: "senha"),
                onChanged: controller.setSenha,
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return Text(
                    controller.formValidado
                        ? "Validado"
                        : "* Campos não validados",
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                builder: (_) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed:
                        controller.formValidado
                            ? () {
                              controller.logar();
                            }
                            : null,
                    child:
                        controller.carregando
                            ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                            : Text(
                              "Logar",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
