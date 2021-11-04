import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(texto,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
