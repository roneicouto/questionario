import 'package:flutter/material.dart';

import './questao.dart';
import './reposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(String) responder;
  final void Function() voltar;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.responder,
    @required this.voltar,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((t) {
          return Resposta(
            t['texto'],
            () => responder(t['texto']),
          );
        }).toList(),
        Resposta('Voltar', voltar),
      ],
    );
  }
}
