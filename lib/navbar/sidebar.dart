import 'package:abcbank/Profile.dart';
import 'package:abcbank/customer.dart';
import 'package:abcbank/pdf.dart';
import 'package:flutter/material.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/CustomerDashbord.dart';
import 'dart:html' as html;

class Sidebar extends StatefulWidget {
  Sidebar({ Key? key, required this.token, this.userID }) : super(key: key);
  String? userID;
  String token;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: _menuItem(title: 'Home'))
                  // _menuItem(title: 'Home')
                ],
              ),
              Row(children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaction(token: widget.token,)));
                    },
                    child: _menuItem(title: 'Transaction')),
              ]),
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => deposite(token: widget.token,)));
                  }, child: _menuItem(title: 'Deposite'))
                  // _menuItem(title: 'Transaction')
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Widthdraw(token: widget.token,)));
                  }, child: _menuItem(title: 'Widthdraw'))
                  // _menuItem(title: 'Transaction')
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pdf(token: widget.token,)));
                    // generatePdf("3");
                  }, child: _menuItem(title: 'Report'))
                  // _menuItem(title: 'Transaction')
                ],
              ),
            ],
          ),
           SizedBox(
            height:(height/2.5) ,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  // Container(
                  //   child: TextButton(onPressed: (){
                  //   Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => profile(token: widget.token,userID: widget.userID.toString())));
                  // }, child: _menuItem(title: 'Report')),
                  // ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profile(token: widget.token,userID: widget.userID.toString())));
                  }, child: _menuItem(title: 'Deshan Salitha')),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: "Home",
                                  )));
                    },
                    child: Container(
                      width: 400,
                      height: 20,
                      child: const Center(child: Text('LogOut')),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _menuItem({Icon, String title = '', bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(children: [
        Text(
          '$title',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30,
              color: isActive ? Colors.deepPurple : Colors.grey),
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        isActive
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30)),
              )
            : const SizedBox()
      ]),
    );
  }

}
/*
class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: () {}, child: _menuItem(title: 'Home'))
                  // _menuItem(title: 'Home')
                ],
              ),
              Row(children: [
                const Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaction()));
                    },
                    child: _menuItem(title: 'Transaction')),
              ]),
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => deposite()));
                  }, child: _menuItem(title: 'Deposite'))
                  // _menuItem(title: 'Transaction')
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Widthdraw()));
                  }, child: _menuItem(title: 'Widthdraw'))
                  // _menuItem(title: 'Transaction')
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 500,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: const Icon(
                      Icons.account_circle_outlined,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    child: TextButton(onPressed: (){
                    Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => profile()));
                  }, child: _menuItem(title: 'Deshan Salitha')),
                  ),
                ],
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage(
                                    title: "Home",
                                  )));
                    },
                    child: Container(
                      width: 400,
                      height: 20,
                      child: const Center(child: Text('LogOut')),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _menuItem({Icon, String title = '', bool isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(children: [
        Text(
          '$title',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 30,
              color: isActive ? Colors.deepPurple : Colors.grey),
        ),
        // const SizedBox(
        //   height: 60,
        // ),
        isActive
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(30)),
              )
            : const SizedBox()
      ]),
    );
  }
}
*/