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
  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      print(_perguntaSelecionada);
    });
  }

  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto': 'Qual a cor da faixa branca',
        'respostas': ['branca', 'Azul', 'Verde', 'Preta']
      },
      {
        'texto': 'Quantos chutes são aprendidos na faixa branca do Tae kwon Do',
        'respostas': ['4', '5', '1', '3']
      },
      {
        'texto': 'Qual o Teguk aprendido na faixa branca do Tae Kwon Do?',
        'respostas': [
          'Saju Jirugui',
          'Nabe Jirugui',
          'Oppi Jirugui',
          'Ninja Jirugui'
        ]
      },
    ];

    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = [];
    respostas.forEach((element) {
      widgets.add(Resposta(element, _responder));
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...widgets
          ],
        ),
      ),
    );
  }
}
