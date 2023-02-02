import 'package:flutter/material.dart';
import 'package:mystudent/data/teacher.dart';
import 'package:mystudent/login.dart';
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
          appBar: AppBar(
            title: const Text("Menu"),
            backgroundColor: Colors.green[800],
          ),
          backgroundColor: Colors.green[80],
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(teacher.name ?? ""),
                  accountEmail: Text(teacher.email ?? ""),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(teacher.image ?? ""),
                  ),
                  decoration: BoxDecoration(color: Colors.green[800]),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyProfile()));
                  },
                  splashColor: Colors.greenAccent,
                  child: const ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Profile"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  splashColor: Colors.greenAccent,
                  child: const ListTile(
                    leading: Icon(Icons.vpn_key),
                    title: Text("Setting Password"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  splashColor: Colors.greenAccent,
                  child: const ListTile(
                    leading: Icon(Icons.info),
                    title: Text("Info"),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  splashColor: Colors.greenAccent,
                  child: const ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("Logout"),
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(40.0),
            child: GridView.count(
              primary: false,
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "Class",
                  iconData: Icons.class_,
                  warna: Colors.lightBlue,
                ),
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "List Student",
                  iconData: Icons.school,
                  warna: Colors.lightBlue,
                ),
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "Account",
                  iconData: Icons.person_pin,
                  warna: Colors.lightBlue,
                ),
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "Setting",
                  iconData: Icons.list_alt_sharp,
                  warna: Colors.lightBlue,
                ),
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "Subject",
                  iconData: Icons.local_library,
                  warna: Colors.lightBlue,
                ),
                MyMenu(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListStudent()));
                  },
                  title: "Library",
                  iconData: Icons.library_books,
                  warna: Colors.lightBlue,
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

class MyMenu extends StatelessWidget {
  String? title;
  IconData? iconData;
  MaterialColor? warna;
  Function onTap;

  MyMenu({this.title, this.iconData, this.warna, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => {onTap()},
        splashColor: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                iconData,
                size: 70.0,
                color: warna,
              ),
              Text(
                title.toString(),
                style: const TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
