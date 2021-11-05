import 'package:flutter/cupertino.dart';
import 'package:quiz/questao.dart';
import 'package:quiz/resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {


    List<String> respostas = perguntas[perguntaSelecionada].cast()['respostas'];
    List<Widget> widgets = [];
    for (var element in respostas) {
      widgets.add(Resposta(element, responder));
    }

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...widgets
      ],
    );
  }
}
