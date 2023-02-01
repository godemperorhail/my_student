import 'package:flutter/material.dart';

import 'package:mystudent/data/account.dart';

import 'homepage.dart';
import 'model/account.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPass = true;

  var userInvalid = false;
  var passInvalid = false;
  var accInvalid = false;

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  DataAccount dataAccount = DataAccount();
  List<Account> lstAccount = [];

  @override
  void initState() {
    lstAccount = dataAccount.dataAccount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
            constraints: const BoxConstraints.expand(),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: Image.asset(
                          'assets/images/banner-manhwa-lookism.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const Image(
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/meoden.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const Text("Lookism School\nWelcome!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 40)),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TextField(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      controller: controllerUsername,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText:
                            userInvalid ? "Your username is wrong" : null,
                        labelText: "Username",
                        labelStyle: const TextStyle(
                            color: Colors.lightBlue, fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: TextField(
                      obscureText: showPass,
                      controller: controllerPassword,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "Password",
                          errorText: passInvalid
                              ? "Your password is wrong and not enough 8 character"
                              : null,
                          labelStyle: const TextStyle(
                              color: Colors.lightBlue, fontSize: 16),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                              icon: Icon(showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),
                  //*Login
                  InkWell(
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      color: Colors.lightBlueAccent,
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () {
                      signedClick();
                    },
                  ),
                  Visibility(
                      visible: accInvalid,
                      child: const Text(
                        "Account does not exist",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      )),
                  //*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does not have account?'),
                      InkWell(
                        child: const Text(
                          'Sign in',
                          style:
                              TextStyle(fontSize: 20, color: Colors.lightBlue),
                        ),
                        onTap: () {
                          //signup screen
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signedClick() {
    if (validateData()) {
      int index = -1;
      for (int i = 0; i < lstAccount.length; i++) {
        if (lstAccount[i].username == controllerUsername.text &&
            lstAccount[i].password == controllerPassword.text) {
          index = i;
          break;
        }
      }
      if (index != -1) {
        setState(() {
          accInvalid = false;
        });
        Navigator.push(
            (context),
            MaterialPageRoute(
                builder: (context) => HomePage(lstAccount[index].id)));
      } else {
        setState(() {
          accInvalid = true;
        });
      }
    }
  }

  bool validateData() {
    if (controllerUsername.text.length < 5) {
      userInvalid = true;
    } else {
      userInvalid = false;
    }
    if (controllerPassword.text.length < 8) {
      passInvalid = true;
    } else {
      passInvalid = false;
    }
    if (userInvalid || passInvalid) {
      setState(() {});
    }
    return !userInvalid && !passInvalid;
  }
}
