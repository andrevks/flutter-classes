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
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Database.addStudent(
                    name: _controllerName.text,
                    socialMedia: _controllerSocialMedia.text);
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
