import 'package:mystudent/model/teacher.dart';

class DataTeacher {
  final teacher1 = Teacher("1",
      name: "Violet",
      email: "violet@gmail.com",
      birthday: DateTime(1956, 12, 30),
      address: "Japanese",
      phoneNumber: 0325698741,
      classroom: "Zio1",
      image: 'assets/images/teacher1.png');
  final teacher2 = Teacher("2",
      name: "Black Bullet",
      email: "blachshooter@gmail.com",
      birthday: DateTime(1956, 9, 28),
      address: "Japanese",
      phoneNumber: 0325698741,
      classroom: "Zio2",
      image: 'assets/images/teacher2.png');

  List<Teacher> dataTeacher() {
    List<Teacher> lstTeacher = [teacher1, teacher2];

    return lstTeacher;
  }
}
