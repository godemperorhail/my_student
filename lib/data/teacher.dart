import 'package:mystudent/model/teacher.dart';

class DataTeacher {
  final teacher1 = Teacher("1",
      name: "Violet",
      birthday: DateTime(1956, 12, 10),
      address: "Japanese",
      phoneNumber: 0325698741,
      classroom: "Zio1",
      image: 'assets/images/teacher1.png');
  final teacher2 = Teacher("2",
      name: "Black Bullet",
      birthday: DateTime(1956, 9, 10),
      address: "Japanese",
      phoneNumber: 0325698741,
      classroom: "Zio2",
      image: 'assets/images/teacher2.png');

  List<Teacher> dataTeacher() {
    List<Teacher> lstTeacher = [teacher1, teacher2];

    return lstTeacher;
  }
}
