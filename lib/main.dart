import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import 'package:quiz/resultado.dart';

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

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      print(concluido);
      concluido = false;
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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: !concluido
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(reiniciar: _reiniciar)),
    );
  }
}
