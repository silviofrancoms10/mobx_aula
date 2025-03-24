import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Controller controller = Controller();

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
                  return Text(controller.formValidado ? "Validado" : "* Campos não validados");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: controller.formValidado ? () {} : null,
                child: Text("Logar", style: TextStyle(color: Colors.black, fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
