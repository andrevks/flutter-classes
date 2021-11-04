// ignore_for_file: prefer_const_constructors

import 'package:evirtual/models/database.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerSocialMedia = TextEditingController();
  TextEditingController _controllerAge = TextEditingController();
  TextEditingController _controllerSex = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(
              'Cadastro de Estudantes',
              style: TextStyle(fontSize: 30),
            ),
            TextFormField(
              controller: _controllerName,
              decoration: InputDecoration(
                labelText: 'Nome do Estudante',
                labelStyle: TextStyle(color: Colors.blue),
                hintText: 'Inform o nome do estudante',
              ),
            ),
            TextFormField(
              controller: _controllerSocialMedia,
              decoration: InputDecoration(
                labelText: 'Redes Sociais',
                labelStyle: TextStyle(color: Colors.blue),
                hintText: 'Informe a rede social',
              ),
            ),
            TextFormField(
              controller: _controllerAge,
              decoration: InputDecoration(
                labelText: 'Idade do Estudate',
                labelStyle: TextStyle(color: Colors.blue),
                hintText: 'Informe a idade do estudante',
              ),
            ),
            TextFormField(
              controller: _controllerSex,
              decoration: InputDecoration(
                labelText: 'Sexo do Estudante',
                labelStyle: TextStyle(color: Colors.blue),
                hintText: 'Informe o sexo do estudante',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Database.addStudent(
                    name: _controllerName.text,
                    socialMedia: _controllerSocialMedia.text,
                    age: _controllerAge.text.isEmpty
                        ? null
                        : int.parse(_controllerAge.text),
                    sex: _controllerSex.text.isEmpty
                        ? " "
                        : _controllerSex.text);
                Navigator.of(context).pop();
              },
              child: Text("Adicionar Estudante"),
            )
          ],
        ),
      )),
    );
  }
}
