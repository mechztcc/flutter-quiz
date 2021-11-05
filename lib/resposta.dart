import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final funcao;

  Resposta(this.texto, this.funcao);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: double.infinity,
      child: ElevatedButton(onPressed: funcao, child: Text(texto))
    );
  }
}
