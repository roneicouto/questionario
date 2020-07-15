import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _respostas = [];

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1}
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 5},
        {'texto': 'Elefante', 'pontuacao': 3},
        {'texto': 'Leão', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu professor favorito?',
      'respostas': [
        {'texto': 'Maria', 'pontuacao': 10},
        {'texto': 'João', 'pontuacao': 5},
        {'texto': 'Leo', 'pontuacao': 3},
        {'texto': 'Pedro', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu pai favorito?',
      'respostas': [
        {'texto': 'Ronei', 'pontuacao': 10},
        {'texto': 'Ronei', 'pontuacao': 5},
        {'texto': 'Ronei', 'pontuacao': 3},
        {'texto': 'Ronei', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu tio favorito?',
      'respostas': [
        {'texto': 'Felipe', 'pontuacao': 10},
        {'texto': 'Felipe', 'pontuacao': 5},
        {'texto': 'Felipe', 'pontuacao': 3},
        {'texto': 'Felipe', 'pontuacao': 1},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(String resposta) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _respostas.add(resposta);
      });
    }
    print(_respostas);
  }

  void voltar() {
    setState(() {
      _perguntaSelecionada--;
      _respostas.removeLast();
    });
    print(_respostas);
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      _respostas.clear();
    });
  }

  String get results {
    return this._respostas.toString();
  }

  @override
  Widget build(BuildContext context) {
    var resultFinal = 'Parabéns! Suas respostas foram: \n'
        '$results';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas da Maria'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                responder: _responder,
                voltar: this.voltar,
              )
            : Resultado(resultFinal, _reiniciar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
