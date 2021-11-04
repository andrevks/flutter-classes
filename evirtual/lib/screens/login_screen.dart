import 'package:evirtual/models/database.dart';
import 'package:evirtual/screens/crud_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final String title;
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: Database.initializerFirebase(),
          builder: (context, snapshot) {
            return Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Text(widget.title),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: TextFormField(
                      controller: _userIdController,
                      style: TextStyle(color: Colors.green),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: "Nome do usuário",
                        hintText: "Informe o identificador do usuário",
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Database.userId = _userIdController.text;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CrudScreen()));
                      debugPrint("${_userIdController.text} realizou login");
                    },
                    child: Text("Realizar Login"),
                  )
                ],
              ),
            );
          },
        ));
  }
}
