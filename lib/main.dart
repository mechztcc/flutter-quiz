import 'package:flutter/material.dart';
import 'package:quiz/resposta.dart';

import './questao.dart';

main() => runApp(PerguntaApp());

@override
class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int perguntaSelecionada = 0;

  void responder() {
    setState(() {
      perguntaSelecionada++;
      print(perguntaSelecionada);
    });
  }

  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual a cor da faixa branca',
      'Qual a cor da faixa amarela',
      'Qual a cor da faixa preta',
      'Qual a cor da faixa azul',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [ 
            Questao(perguntas[perguntaSelecionada]),
            Resposta('Resposta 1', responder),
            Resposta('Resposta 2', responder),
            Resposta('Resposta 3', responder),
           
          ],
        ),
      ),
    );
  }
}
