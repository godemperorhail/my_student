import 'package:flutter/material.dart';

import 'package:mystudent/data/student.dart';

import 'package:mystudent/model/student.dart';
import 'package:mystudent/student_detail.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({Key? key}) : super(key: key);

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  DataStudent dataStudent = DataStudent();
  late List<Student> lstStudent = [];

  @override
  void initState() {
    lstStudent = dataStudent.dataStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ListView(children: myListView())),
        ),
      ),
    );
  }

  List<Widget> myListView() {
    return List.generate(lstStudent.length, (index) {
      return InkWell(
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StudentDetail(lstStudent[index])));
          });
        },
        child: Card(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(lstStudent[index].image ?? "")
                ),
                title:Text(lstStudent[index].name.toString()),
                subtitle:Text(lstStudent[index].phoneNumber.toString()),
                trailing:Text(lstStudent[index].classroom.toString()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
