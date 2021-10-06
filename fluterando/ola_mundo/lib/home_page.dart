import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    //O Stateful pede um estado (State)
    //Entao, a gente precisa criar uma outra classe
    //para que possa ser retornada aqui e
    //Funcionar como um estado que vai ser sempre
    //modificado.

    return HomePageState(); //Soh funciona para essa classe
  }
}

//No State (estado) precisa passar o nome da classe
//de StateFulWidget que eh a classe que vai nos
//referenciaR
class HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
        child: Text('Contador: $count'),
        onTap: () {
          setState(() {
            count++;
          });
        },
      )),
    );
  }
}
