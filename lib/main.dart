import 'dart:convert';

import 'package:abcbank/AdminDashboard.dart';
import 'package:abcbank/CustomerDashbord.dart';
import 'package:abcbank/customer.dart';
import 'package:abcbank/model/Auth_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Home"),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _username = "";
  String _password = "";
  AuthResponse? authresponse;
  var body = {};
  bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAuthenticate();
  }

  void getAuthenticate() async {
    setState(() {
      _loading = true;
    });
    body["userEmail"] = _username;
    body["password"] = _password;
    String bodyJason = json.encode(body);
    var response = await http.post(
        Uri.parse("http://localhost:8080/authenticate"),
        headers: {"Content-Type": "application/json"},
        body: bodyJason);

    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      authresponse = authResponseFromJson(response.body);
      // setState(() {});
      // for (int i = 0; i < userresponse!.body!.length; i++) {
      // print(authresponse!.body!.user);
      // print(authresponse!.body!.jwt);
      // print(authresponse!.body!.user!.userType);
      // }
      if (authresponse!.body!.user!.userType == 'admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AdminHome(
                      token: authresponse!.body!.jwt.toString(),
                    )));
      } else if (authresponse!.body!.user!.userType == 'customer') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => customer(
                      token: authresponse!.body!.jwt.toString(),
                    )));
      } else if (authresponse!.body!.user!.userType == 'employee') {
        print('employee dashboard');
      } else {
        print('invalid');
      }

      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
          msg: "Welcome " + _username.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                color: Colors.black87,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: const Text(
                        "Welcome to ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: SizedBox(
                width: 300,
                child: _formLogin(),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _formLogin() {
    return Column(
      children: [
        const Text(
          "ABC Bank",
          style: TextStyle(
            color: Colors.black,
            fontSize: 50,
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 20,
        ),
        const Text(
          "We Make Your Life Easier",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 500,
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Email',
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
            onChanged: (val) {
              _username = val;
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: 500,
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Password',
                counterText: 'Forgot password?',
                suffixIcon: const Icon(Icons.visibility_off_outlined,
                    color: Colors.grey),
                fillColor: Colors.blueGrey[50],
                filled: true,
                labelStyle: const TextStyle(fontSize: 12),
                contentPadding: const EdgeInsets.only(left: 30),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
            onChanged: (val) {
              _password = val;
            },
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 209, 196, 233),
                  spreadRadius: 10,
                  blurRadius: 20,
                )
              ]),
          child: ElevatedButton(
            child: Container(
              width: 500,
              height: 50,
              child: const Center(child: Text('Sign in')),
            ),
            onPressed: () {
              print("User Name : " + _username);
              print("Password : " + _password);
              getAuthenticate();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        )
      ],
    );
  }
}
