import 'package:abcbank/Profile.dart';
import 'package:abcbank/customer.dart';
import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/CustomerDashbord.dart';
import 'dart:html' as html;

class pdf extends StatelessWidget {
  

  pdf({ Key? key,required this.token,this.userID }) : super(key: key);
  String token;
  String? userID;
  // generatepdf
  void generatePdf(String userid)async{
    downloadFile("http://localhost:8080/exporttransaction/3");
  }
  // helper function
  void downloadFile(String url){
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }
  

  @override
  Widget build(BuildContext context) {
  String _accNumber ='' ;
  
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
            child: Column(
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
          "Type the Account Number to export PDF",
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
                labelText: 'Account Number',
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
              _accNumber = val;
            },
          ),
        ),
        const SizedBox(
          height: 30,
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
              child: const Center(child: Text('Export PDF')),
            ),
            onPressed: () {
              generatePdf(_accNumber);
              // print("User Name : " + _username);
              // print("Password : " + _password);
              // getAuthenticate();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        )
      ],
    )),
      ],
    ));
  }
  }
