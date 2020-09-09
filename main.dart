import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String fraseRetorno = "aguardando dados ...";
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoEndereco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alertas"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(fraseRetorno),
            RaisedButton(
              child: Text("Confirme"),
              onPressed: (){
                confirma();
              },
            ),
            RaisedButton(
              child: Text("Busca Dados"),
              onPressed: (){
                setState(() {
                  campoNome.text="";
                  campoEndereco.text="";
                });
                entraDados();
              },
            ),
          ],
        ),
      ),
    );
  }

  void confirma(){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(

            title: Text("Atenção!"),
            content: Text("Confirme os dados : "),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  setState(() {
                    fraseRetorno = "Você Cancelou !";
                  });
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Confirmar"),
                onPressed: () {
                  setState(() {
                    fraseRetorno = "Você Confirmouuu !";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }

    );

  }

  void entraDados(){

    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(

            title: Text("Informe os dados!"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: campoNome,
                    decoration: InputDecoration(
                      labelText: "Nome"
                    ),
                  ),
                  TextField(
                    controller: campoEndereco,
                    decoration: InputDecoration(
                        labelText: "Endereço"
                    ),
                  ),

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Confirmar"),
                onPressed: () {
                  setState(() {
                    fraseRetorno = "Nome : ${campoNome.text} \nEndereço : ${campoEndereco.text} " ;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }

    );

  }


}
