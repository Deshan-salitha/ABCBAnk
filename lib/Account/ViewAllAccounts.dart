import 'dart:async';

import 'package:abcbank/Account/AccountProfile.dart';
import 'package:abcbank/UserProfile.dart';
import 'package:abcbank/model/AllAccResponse.dart';
import 'package:abcbank/navbar/adminNavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class ViewAllAcc extends StatelessWidget {
  String token;
  ViewAllAcc({Key? key, required this.token, required this.userID})
      : super(key: key);
  String userID;
  // UserResponse? userresponse;
  // bool loading = false;
  // void getAllUsers() async {
  //   var response = await http.get(
  //     Uri.parse("http://localhost:8080/userall"),
  //     headers: {
  //       "Authorization":
  //           "Bearer $token"
  //     },
  //   );
  //   print("Status Code");
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // print("got in to the function");
  //     userresponse = userResponseFromJson(response.body);
  //     for (int i = 0; i < userresponse!.body!.length; i++) {
  //       print(userresponse!.body![i].ufname);
  //     }
  //   }
  // }
  // String getUserId() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString("userID");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.black87,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(50),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    Container(
                      // padding: const EdgeInsets.all(50),
                      child: const Text(
                        "Admin Menu",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    AdminSidebar(
                      token: token,
                      userID: userID.toString(),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 9,
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  
                  //  SizedBox(
                  //   height: 50,
                  // ),
                  Container(
                      height: 500,
                      width: 500,
                      // child: new ListVewBuilderTransaction(
                      child: new ListVewBuilder(
                        token: token,
                        userID: userID,
                      )),
                  
                ]),
              )),
        ],
      ),
      // SfCircularChart(),
    );
  }
}

class ListVewBuilder extends StatefulWidget {
  ListVewBuilder({Key? key, required this.token, required this.userID})
      : super(key: key);
  String userID;
  String token;
  @override
  State<ListVewBuilder> createState() => _ListVewBuilderState();
}

class _ListVewBuilderState extends State<ListVewBuilder> {
  List<AllAccountsResponse>? allaccresponse;
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAccs();
  }

  void getAllAccs() async {
    setState(() {
      _loading = true;
    });
    // print("$widget");
    var response = await http.post(
      Uri.parse("http://localhost:8080/getallaccounts"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code from all Accs");
    print(response.statusCode);
    if (response.statusCode == 200) {
      allaccresponse = allAccountsResponseFromJson(response.body);
      setState(() {});
      Timer(Duration(seconds: 3), () {
        setState(() {
          _loading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("ListView.builder"),
      // ),
      body: Container(
          child: Column(
        children: [
          _loading
              ? Container(
                  padding: EdgeInsets.all(200),
                  child: SpinKitRing(color: Colors.amber),
                  // child: CircularProgressIndicator(
                  // color: Colors.red,)
                )
              : 
              Container(
                  width: 500,
                  height: 500,
                  child: ListView.builder(
                      itemCount: allaccresponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(Icons.person),
                          trailing: Container(
                              child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Accprofile(
                                                token: widget.token,
                                                userid: widget.userID,
                                                accountID: allaccresponse![index].accNumber.toString(),
                                                    // allaccresponse![index].accNumber.toString()
                                                    )));
                                  },
                                  child: Icon(
                                    Icons.visibility,
                                    color: Colors.black87,
                                  )),
                              // TextButton(
                              //     onPressed: () {
                                    
                              //     },
                              //     child: Icon(
                              //       Icons.delete_forever,
                              //       color: Colors.black87,
                              //     ))
                            ],
                          )),
                          title: Text("Account Number : "+
                              allaccresponse![index].accNumber.toString()
                                  ),
                                  subtitle: Text("Balance : "+allaccresponse![index].balance.toString()),
                        );
                      }),
                )
        ],
      )),
      // body: ListView.builder(
      //     itemCount: userresponse!.body!.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return ListTile(
      //           leading: Icon(Icons.list),
      //           trailing: Text(
      //             "GFG",
      //             style: TextStyle(color: Colors.green, fontSize: 15),
      //           ),
      //           title: Text(userresponse!.body![index].ufname.toString()));
      //     }),
    );
  }
}