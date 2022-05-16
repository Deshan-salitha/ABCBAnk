import 'dart:async';

import 'package:abcbank/model/Auth_response.dart';
import 'package:abcbank/model/transactionResponse.dart';
import 'package:abcbank/model/user_repose.dart';
import 'package:abcbank/main.dart';
import 'package:abcbank/navbar/adminNavbar.dart';
import 'package:abcbank/test.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:math_expressions/math_expressions.dart';
import 'indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AdminHome extends StatelessWidget {
  String token;
  AdminHome({Key? key, required this.token}) : super(key: key);
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
                    AdminSidebar(),
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child: Column(children: [
                  Container(
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 350,
                              height: 350,
                              padding: EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 230, 217, 217),
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 230, 217, 217),
                                //     spreadRadius: 10,
                                //     blurRadius: 20,
                                //   )
                                // ]
                              ),
                              child: PieChartSample2(),
                            ),
                            Container(
                              width: 250,
                              height: 250,
                              // padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 230, 217, 217),
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Color.fromARGB(255, 230, 217, 217),
                                //     spreadRadius: 10,
                                //     blurRadius: 20,
                                //   )
                                // ]
                              ),
                              child: PieChartSample2(),
                            ),
                          ],
                        )
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(10),
                        //   child: Image.asset(
                        //     'images/card.jpg',
                        //     width: 300,
                        //   ),
                        // ),
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: 500,
                      width: 500,
                      // child: new ListVewBuilderTransaction(
                      child: new ListVewBuilder(
                        token: token,
                      )),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  // child: Table(
                  //   // border: TableBorder.all(),
                  //   children: const [
                  //     TableRow(children: [
                  //       Text(
                  //         "TID",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Amount",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Date/Time",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Transaction Type",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Destination Account Number",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ]),
                  //     TableRow(children: [
                  //       Text(
                  //         "1",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "112",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "1999-03-22 10:06:07",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Deposit",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "None",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ]),
                  //     TableRow(children: [
                  //       Text(
                  //         "2",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "112",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "1999-03-22 10:06:07",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Widthdrow",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "None",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ]),
                  //     TableRow(children: [
                  //       Text(
                  //         "3",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "112",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "1999-03-22 10:06:07",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Deposit",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "None",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ]),
                  //     TableRow(children: [
                  //       Text(
                  //         "4",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "112",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "1999-03-22 10:06:07",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "Widthrow",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       Text(
                  //         "None",
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ]),
                  //   ],
                  // ),
                  // ),
                  ElevatedButton(
                      onPressed: () {
                        // getAllUsers();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Myapp1()));
                      },
                      child: Text("getData")),
                ]),
              )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'images/ad.jpg',
                          // width: 300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 230, 217, 217),
                          spreadRadius: 10,
                          blurRadius: 20,
                        )
                      ]),
                  child: PieChartSample2(),
                  width: 500,
                )
              ],
            ),
          )
        ],
      ),
      // SfCircularChart(),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
                child: Column(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions ||
                                  pieTouchResponse == null ||
                                  pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse
                                  .touchedSection!.touchedSectionIndex;
                            });
                          }),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections()),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Indicator(
                      color: Color.fromARGB(255, 59, 52, 252),
                      text: 'Employees',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Indicator(
                      color: Color.fromARGB(255, 224, 232, 0),
                      text: 'Customers',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    // Indicator(
                    //   color: Color(0xff845bef),
                    //   text: 'Third',
                    //   isSquare: true,
                    // ),
                    // SizedBox(
                    //   height: 4,
                    // ),
                    // Indicator(
                    //   color: Color(0xff13d38e),
                    //   text: 'Fourth',
                    //   isSquare: true,
                    // ),
                    // SizedBox(
                    //   height: 18,
                    // ),
                  ],
                ),
                const SizedBox(
                    // width: 28,
                    ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Color.fromARGB(255, 59, 52, 252),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Color.fromARGB(255, 224, 232, 0),
            value: 90,
            title: '90%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}

// class Myapp1 extends StatefulWidget {
//   Myapp1({Key? key}) : super(key: key);

//   @override
//   State<Myapp1> createState() => _Myapp1State();
// }

// class _Myapp1State extends State<Myapp1> {
//   // _Myapp1State() {
//   //   getAllUsers();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return ListVewBuilder();
//   }
// }

class ListVewBuilder extends StatefulWidget {
  ListVewBuilder({Key? key, this.token}) : super(key: key);
  String? token;
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
    // print("$widget");
    var response = await http.get(
      Uri.parse("http://localhost:8080/userall"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      userresponse = userResponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < userresponse!.body!.length; i++) {
        print(userresponse!.body![i].ufname);
      }
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
              : Container(
                  width: 500,
                  height: 500,
                  child: ListView.builder(
                      itemCount: userresponse!.body!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.person),
                            trailing: Container(
                                child: Column(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Icon(Icons.visibility,color: Colors.black87,)
                                )
                              ],
                            )),
                            title: Text(
                                userresponse!.body![index].ufname.toString() +" "+ userresponse!.body![index].ulname.toString()));
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

// --------------------------------------transaction list view------------------------------------------------------------
class ListVewBuilderTransaction extends StatefulWidget {
  ListVewBuilderTransaction({Key? key, this.token}) : super(key: key);
  String? token;
  @override
  State<ListVewBuilderTransaction> createState() =>
      _ListVewBuilderTransactionState();
}

class _ListVewBuilderTransactionState extends State<ListVewBuilderTransaction> {
  List<TransactionResponse>? transactionresponse;
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
    // print("$widget");
    var response = await http.get(
      Uri.parse("http://localhost:8080/alltransactions"),
      headers: {"Authorization": "Bearer ${widget.token}"},
    );
    print("Status Code");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      transactionresponse = transactionResponseFromJson(response.body);
      setState(() {});
      for (int i = 0; i < transactionresponse!.length; i++) {
        print(transactionresponse![i].ownerAcc);
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
      body: Container(
          child: Column(
        children: [
          _loading
              ? Container(
                  child: SpinKitCubeGrid(
                    color: Colors.amber,
                  ),
                  // child: CircularProgressIndicator(
                  // color: Colors.red,)
                )
              : Container(
                  width: 500,
                  height: 500,
                  // color: Colors.blue,
                  child: ListView.builder(
                      itemCount: transactionresponse!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            leading: Icon(Icons.person),
                            trailing: Container(
                                child: Column(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black87,
                                    ))
                              ],
                            )),
                            title: Text(transactionresponse![index]
                                .ownerAcc
                                .toString()));
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
