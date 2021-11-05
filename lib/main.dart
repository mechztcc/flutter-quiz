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
  bool concluido = false;

  void _responder() {
    setState(() {
      if (_perguntaSelecionada < _perguntas.length - 1) {
        _perguntaSelecionada++;
      } else {
        concluido = true;
      }
    });
  }

  final List<Map<String, Object>> _perguntas = const [
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

  Widget build(BuildContext context) {
    List<String> respostas =
        _perguntas[_perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = [];
    respostas.forEach((element) {
      widgets.add(Resposta(element, _responder));
    });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: !concluido
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...widgets
                ],
              )
            : Column(
                children: [
                  Center(
                      child: Text('Questionário concluído!',
                          style: TextStyle(fontSize: 28))),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _perguntaSelecionada = 0;
                              concluido = false;
                            });
                          },
                          child: Text('Reiniciar'))),
                ],
              ),
      ),
    );
  }
}
