import 'package:flutter/material.dart';
import './reposta.dart';

class Resultado extends StatelessWidget {
  final List<String> respostas = [];

  final String results;
  final void Function() restartQuests;

  Resultado(this.results, this.restartQuests);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            results,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Resposta('Reiniciar Questionário', restartQuests),
      ],
    );
  }
}
