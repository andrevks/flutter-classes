import 'package:evirtual/screens/add_student_screen.dart';
import 'package:evirtual/screens/list_screen.dart';
import 'package:flutter/material.dart';

class CrudScreen extends StatelessWidget {
  const CrudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sistema Acadêmico"),
      ),
      body: ListScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddStudentScreen()));
        },
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
