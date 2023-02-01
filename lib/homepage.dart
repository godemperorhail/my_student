import 'package:flutter/material.dart';
import 'package:mystudent/data/teacher.dart';
import 'list_student.dart';
import 'model/teacher.dart';
import 'myprofile.dart';

class HomePage extends StatefulWidget {
  String? id;

  HomePage(this.id);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late Teacher teacher;

  @override
  void initState() {
    teacher = initTeacher();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Flexible(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyProfile()));
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Thông Tin Tài Khoản"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListStudent()));
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Danh Sách Học Sinh"),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Danh Sách Đồng nghiệp"),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text("Tình Trạng Học Phí"),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text(
                              "Danh Sách Học Sinh Đã Hoàn Thành Đóng Học Phí"),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.teal[100],
                          child: const Text(
                              "Danh Sách Học Sinh Chưa Hoàn Thành Đóng Học Phí"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  color: Colors.blue,
                  child: Column(
                    children: [
                      const Text("Thông Tin Giáo Viên:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent,
                            fontSize: 30,
                          )),
                      Text(teacher.name.toString()),
                      Text(teacher.phoneNumber.toString()),
                      Text(teacher.birthday.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Teacher initTeacher() {
    DataTeacher dataTeacher = DataTeacher();
    List<Teacher> lstDataTeacher = dataTeacher.dataTeacher();

    for (int i = 0; i < lstDataTeacher.length; i++) {
      if (widget.id == lstDataTeacher[i].id) {
        return lstDataTeacher[i];
      }
    }
    return lstDataTeacher[0];
  }
}
