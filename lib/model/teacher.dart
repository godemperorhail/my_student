
class Teacher {
  String? id;
  String? name;
  String? email;
  DateTime? birthday;
  String? address;
  int? phoneNumber;
  String? classroom;
  String? image;

  Teacher(this.id,
      {required this.name,
      required this.email,
      required this.birthday,
      required this.address,
      required this.phoneNumber,
      required this.classroom,
      required this.image});
}
