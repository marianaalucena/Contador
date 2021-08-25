import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //Chamamos o runApp e neles passamos um widget do tipo MaterialApp
  runApp(MaterialApp(
    //parametros opcionais (homepage, title), portanto, sao usado com :
    title: "Contador de Pessoas",

    //home: tela
    //Stack: para sobreposicao de widget, temos imagem e a coluna em cima
    home: Home()
  ));
}

// esse widget possui um estado interno
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta){
    //executa o que tem dentro e em seguida atualiza o estado, redesenha a tela com o people atualizado
    setState(() {
      _people += delta;

      if(_people < 0) {
        _infoText = "Restaurante vazio.";
      } else if(_people <= 10){
        _infoText = "Pode entrar.";
      } else{
        _infoText = "Lotado!";
      }
    });


  }

  // build eh chamado sempre que queremos mudar algo no layout
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //primeiro sera passado o widget que ficara embaixo (nesse caso, a imagem)
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover, //preenchimento da imagem
          height: 1000.0,
        ),
        Column(
          //alinhamento do eixo principal da coluna
          mainAxisAlignment: MainAxisAlignment.center,

          //pode receber infinitos filhos
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),

            //onPressed e child sao parametros obrigatorios
            //child: flatButton pode ter apenas um filho
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Para podermos dar o espaçamento que acharmos necessario
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),

            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
          ],
        )
      ],
    );
  }
}
