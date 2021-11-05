import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final reiniciar;

  Resultado({required this.reiniciar});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          child: const Center(
              child:
                  Text('Concluído, Parabéns!', style: TextStyle(fontSize: 30))),
        ),
        IconButton(
          onPressed: reiniciar,
          icon: Icon(Icons.restart_alt),
          tooltip: 'Tentar novamente',
        ),
        const Text('Tentar novamente')
      ],
    );
  }
}
