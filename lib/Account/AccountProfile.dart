import 'dart:async';

import 'package:abcbank/model/SingleAccountResponse.dart';
import 'package:abcbank/model/SingleUserResponse.dart';
import 'package:abcbank/navbar/adminNavbar.dart';
import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/CustomerDashbord.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;


class Accprofile extends StatefulWidget {
  Accprofile({ Key? key,required this.token,required this.accountID,required this.userid }) : super(key: key);
  String userid;
  String token;
  String accountID;

  @override
  State<Accprofile> createState() => _AccprofileState();
}

// ignore: camel_case_types
class _AccprofileState extends State<Accprofile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAcc();
    print("hi fro init");
  }
  SingleAccountResponse? singleaccresponse;
  String Accid='';
  String uname='';
  String lname='';
  String email='';
  String address='';
  String balance='';
  var body = {};
  bool _loading = false;
  
  void getAcc() async {
    setState(() {
      _loading = true;
    });
    // print("$widget");
    var response = await http.post(
      Uri.parse("http://localhost:8080/accbyid/${widget.accountID}"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code from all Accs");
    print(response.statusCode);
    if (response.statusCode == 200) {
      singleaccresponse = singleAccountResponseFromJson(response.body);
      Accid = singleaccresponse!.accNumber.toString();
      uname = singleaccresponse!.owner!.ufname.toString();
      lname = singleaccresponse!.owner!.ulname.toString();
      email = singleaccresponse!.owner!.email.toString();
      address = singleaccresponse!.owner!.address.toString();
      balance = singleaccresponse!.balance.toString();
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
        body: Row(
      children: [
        Expanded(flex: 3, child: Container(color: Colors.black,child: Column(children: [Container(
                      padding: const EdgeInsets.all(50),
                      child: const Text(
                        "ABC Bank",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),AdminSidebar(token: widget.token,userID: widget.userid,)],)),),
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
                              Text("Account Number : "+Accid,style: TextStyle(fontSize: 20,color: Colors.deepPurple),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.nam,size: 50,),
                              Text("First Name : "+uname,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text("Last Name : "+lname,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text("Address : "+address,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text("E-mail : "+email,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                             Text("Account Balance : "+balance,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                              // TextButton(onPressed: (){}), child: child)
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.person,size: 50,),
                            //  Text(pass,style: TextStyle(fontSize: 20),),Padding(padding: EdgeInsets.all(30)),
                              TextButton(
                                  onPressed: () {
                                    // deleteUser();
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
