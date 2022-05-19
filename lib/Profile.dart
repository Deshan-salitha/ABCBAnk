import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/CustomerDashbord.dart';
class profile extends StatelessWidget {
  

  profile({ Key? key,required this.token }) : super(key: key);
  String token;

  @override
  Widget build(BuildContext context) {
  String _accNumber ='' ;
  String _amount ='';
  String _datetime ='';
  // final String _dateTime;
  String _DessAccNumber ='';
    return Scaffold(
        body: Row(
      children: [
        Expanded(flex: 3, child: Container(color: Colors.black,child: Column(children: [Container(
                      padding: const EdgeInsets.all(50),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),Sidebar(token: token,)],)),),
        Expanded(
            flex: 9,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const Text(
                  //   "ABC Bank",
                  //   style: TextStyle(
                  //     color: Colors.black,
                  //     fontSize: 50,
                  //   ),
                  // ),
                  // // ignore: prefer_const_constructors
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
                              Text("01",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.nam,size: 50,),
                              Text("Deshan",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text("Wickramaarachchi",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text("Jayanthipura Polonnaruwa",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text("D@gmail.com",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                              Text("Password",style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                        ],
                      ),
                  ),
                  // Container(
                  //   child: ElevatedButton(
                  //     child: Container(
                  //       width: 500,
                  //       height: 50,
                  //       child: const Center(child: Text('Widthdraw')),
                  //     ),
                  //     onPressed: () {
                  //       // print(_accNumber)
                  //       print("Account Number : "+_accNumber);
                  //       print("deposite Amount : "+_amount);
                  //       print("Date/Time : "+_datetime);
                  //       // print("Destination Account Number : "+_DessAccNumber);
                  //       Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => CustomerHome()));
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //         primary: Colors.deepPurple,
                  //         onPrimary: Colors.white,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10))),
                  //   ),
                  // )
              ],
              ),
            )),
      ],
    ));
  }
  }
