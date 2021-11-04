import 'package:evirtual/models/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.studentsList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Não existe dados no Firebase!!!");
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            itemCount: snapshot.data!.docs.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index) {
              String docId = snapshot.data!.docs[index].id;
              String name = snapshot.data!.docs[index].get('name');
              String socialMedia =
                  snapshot.data!.docs[index].get('socialMedia');
              String age = snapshot.data!.docs[index].get('age').toString();
              String sex = snapshot.data!.docs[index].get('sex');
              return ListTile(
                title: Text(name),
                subtitle: Text(socialMedia),
                trailing: Text(age),
                leading: Text(sex),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
