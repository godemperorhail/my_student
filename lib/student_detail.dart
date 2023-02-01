import 'package:flutter/material.dart';

import 'model/student.dart';

class StudentDetail extends StatefulWidget {
  Student student;

  StudentDetail(this.student);

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  width: 100,
                  height: 100,
                  child: Image(
                    image: AssetImage(widget.student.image.toString()),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text("Tên :"),
                        Text(widget.student.name.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Ngày Sinh :"),
                        Text(widget.student.birthday.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Số Điện Thoại :"),
                        Text(widget.student.phoneNumber.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Địa Chỉ :"),
                        Text(widget.student.address.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Lớp :"),
                        Text(widget.student.classroom.toString()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
