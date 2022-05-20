import 'dart:async';

import 'package:abcbank/model/SingleUserResponse.dart';
import 'package:abcbank/navbar/adminNavbar.dart';
import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/CustomerDashbord.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;


class Userprofile extends StatefulWidget {
  Userprofile({ Key? key,required this.token,required this.userID }) : super(key: key);
  String token;
  String userID;

  @override
  State<Userprofile> createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<Userprofile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    print("hi fro init");
  }
  SingleuserResponse? singleuserresponse;
  String id='';
  String uname='';
  String lname='';
  String email='';
  String address='';
  String pass='';
  var body = {};
  bool _loading = false;
  
  void getUser() async {
    setState(() {
      _loading = true;
    });
    // print("$widget");
    var response = await http.post(
      Uri.parse("http://localhost:8080/usebyid/${widget.userID}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      singleuserresponse = singleuserResponseFromJson(response.body);
      id = singleuserresponse!.uId.toString();
      uname = singleuserresponse!.uFName.toString();
      lname = singleuserresponse!.uLName.toString();
      email = singleuserresponse!.userEmail.toString();
      address = singleuserresponse!.address.toString();
      pass = singleuserresponse!.password.toString();
      print(singleuserresponse!.uId);
      print(singleuserresponse!.uFName);
      print(singleuserresponse!.uLName);
      print(singleuserresponse!.userEmail);
      print(singleuserresponse!.address);
      Timer(Duration(seconds: 2), () {
        setState(() {
          _loading = false;
        });
      });
    }
  }

  void deleteUser()async{
    setState(() {
      _loading = true;
    });
    // print("$widget");
    var response = await http.delete(
      Uri.parse("http://localhost:8080/deletebyid/${widget.userID}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code from delete");
    print(response.statusCode);
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(flex: 3, child: Container(color: Colors.black,child: Column(children: [Container(
                      padding: const EdgeInsets.all(50),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),AdminSidebar(token: widget.token,userID: widget.userID,)],)),),
        Expanded(
            flex: 9,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                children: [_loading ?
                Container(padding: EdgeInsets.all(200),
                  child: SpinKitRing(color: Colors.amber),
                  // child: CircularProgressIndicator(
                  // color: Colors.red,)
                  ) : 
                Container(child: Column(children: [
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
                  const Icon(Icons.account_circle_outlined,
                    color: Colors.grey,size: 100,),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 100),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text(id,style: TextStyle(fontSize: 20,color: Colors.deepPurple),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.nam,size: 50,),
                              Text(uname,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text(lname,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text(address,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text(email,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text(pass,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                              // TextButton(onPressed: (){}), child: child)
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                            //  Text(pass,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                              TextButton(
                                  onPressed: () {
                                    deleteUser();
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),

                        ],
                      ),
                  ),],),)
                  
              ],
              ),
            )),
      ],
    ));
  }
}
// class profile1 extends StatelessWidget {
  

//   profile1({ Key? key,required this.token,this.userID }) : super(key: key);
//   String token;
//   String? userID;
  

//   @override
//   Widget build(BuildContext context) {
//   String _accNumber ='' ;
//   String _amount ='';
//   String _datetime ='';
//   // final String _dateTime;
//   String _DessAccNumber ='';
//     return Scaffold(
//         body: Row(
//       children: [
//         Expanded(flex: 3, child: Container(color: Colors.black,child: Column(children: [Container(
//                       padding: const EdgeInsets.all(50),
//                       child: const Text(
//                         "ABC Bank",
//                         style: TextStyle(color: Colors.white, fontSize: 30),
//                       ),
//                     ),Sidebar(token: token,)],)),),
//         Expanded(
//             flex: 9,
//             child: Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // const Text(
//                   //   "ABC Bank",
//                   //   style: TextStyle(
//                   //     color: Colors.black,
//                   //     fontSize: 50,
//                   //   ),
//                   // ),
//                   // // ignore: prefer_const_constructors
//                   SizedBox(
//                     height: 20,
//                   ),
//                   const Icon(Icons.account_circle_outlined,
//                     color: Colors.grey,size: 100,),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 100),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               // Icon(Icons.person,size: 50,),
//                               Text("01",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // Icon(Icons.nam,size: 50,),
//                               Text("Deshan",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // Icon(Icons.person,size: 50,),
//                               Text("Wickramaarachchi",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // Icon(Icons.person,size: 50,),
//                               Text("Jayanthipura Polonnaruwa",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // Icon(Icons.person,size: 50,),
//                               Text("D@gmail.com",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // Icon(Icons.person,size: 50,),
//                               Text("Password",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
//                             ],
//                           ),
//                         ],
//                       ),
//                   ),
//                   // Container(
//                   //   child: ElevatedButton(
//                   //     child: Container(
//                   //       width: 500,
//                   //       height: 50,
//                   //       child: const Center(child: Text('Widthdraw')),
//                   //     ),
//                   //     onPressed: () {
//                   //       // print(_accNumber)
//                   //       print("Account Number : "+_accNumber);
//                   //       print("deposite Amount : "+_amount);
//                   //       print("Date/Time : "+_datetime);
//                   //       // print("Destination Account Number : "+_DessAccNumber);
//                   //       Navigator.pushReplacement(
//                   //           context,
//                   //           MaterialPageRoute(
//                   //               builder: (context) => CustomerHome()));
//                   //     },
//                   //     style: ElevatedButton.styleFrom(
//                   //         primary: Colors.deepPurple,
//                   //         onPrimary: Colors.white,
//                   //         shape: RoundedRectangleBorder(
//                   //             borderRadius: BorderRadius.circular(10))),
//                   //   ),
//                   // )
//               ],
//               ),
//             )),
//       ],
//     ));
//   }
//   }
