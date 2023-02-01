import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  // String? id;
  //
  // MyProfile(this.id);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(),
        ),
      ),
    );
  }
}
