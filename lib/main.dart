import 'package:abcbank/CustomerDashbord.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                color: Colors.greenAccent[700],
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
                  borderSide: const BorderSide(
                      color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (val){
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
                  borderSide: const BorderSide(
                      color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 128, 255)),
                  borderRadius: BorderRadius.circular(15),
                )),
                onChanged: (val){
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
              print("User Name : "+_username);
              print("Password : "+_password);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomerHome()));
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
