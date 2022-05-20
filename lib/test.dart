import 'dart:ui';

import 'package:abcbank/AdminDashboard.dart';
import 'package:abcbank/model/user_repose.dart';
import 'package:abcbank/onlineuser_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// void main() => runApp(MyApp());

class Myapp1 extends StatefulWidget {
  Myapp1({Key? key}) : super(key: key);

  @override
  State<Myapp1> createState() => _Myapp1State();
}

class _Myapp1State extends State<Myapp1> {
  // _Myapp1State() {
  //   getAllUsers();
  // }
  

  @override
  Widget build(BuildContext context) {
    return ListVewBuilder();
  }
}

class ListVewBuilder extends StatefulWidget {
  const ListVewBuilder({ Key? key }) : super(key: key);

  @override
  State<ListVewBuilder> createState() => _ListVewBuilderState();
}

class _ListVewBuilderState extends State<ListVewBuilder> {
  UserResponse? userresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }

  void getAllUsers() async {
    setState(() {
      _loading = true;
    });
    var response = await http.get(
      Uri.parse("http://localhost:8080/userall"),
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTQGdtYWlsLmNvbSIsImV4cCI6MTY1MjQ4MDY4NywiaWF0IjoxNjUyNDQ0Njg3fQ.O_RUSAtrrJSB4nksIdeSLFETzRjY7TyEN2jpoYyYRX8"
      },
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      userresponse = userResponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < userresponse!.body!.length; i++) {
        print(userresponse!.body![i].uFName);
      }

      setState(() {
        _loading = false;
      });
    }
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ListView.builder"),
      // ),
      
      body: ListView.builder(
          itemCount: userresponse!.body!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: Icon(Icons.list),
                trailing: Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text(userresponse!.body![index].uFName.toString()));
          }),
    );
  }
}


// class ListViewBuilder extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("ListView.builder"),
//       // ),
//       body: ListView.builder(
//           itemCount: 5,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//                 leading: Icon(Icons.list),
//                 trailing: Text(
//                   "GFG",
//                   style: TextStyle(color: Colors.green, fontSize: 15),
//                 ),
//                 title: Text("List item $index"));
//           }),
//     );
//   }
// }
