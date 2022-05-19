import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:abcbank/main.dart';
import 'package:abcbank/model/SingleUserResponse.dart';
import 'package:abcbank/model/transactionResponse.dart';
import 'package:abcbank/model/user_repose.dart';
import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:path/path.dart';

class customer extends StatefulWidget {
  customer({Key? key, required this.token,required this.userID}) : super(key: key);
  String userID;
  String token;
  bool _isAll = true;
  bool _isWidthrow = false;
  bool _isDeposit = false;
  bool _isTransaction = false;

  @override
  State<customer> createState() => _customerState();
}

class _customerState extends State<customer> {
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
                    Sidebar(token: widget.token,userID: widget.userID),
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'images/card.jpg',
                            width: 300,
                          ),
                        ),
                        const Text(
                          "\n\n\n\n\n     0123    4567    8901    2345",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const Text(
                          "\n\n\n\n\n\n\n\n  W.A.S.R.Deshan Wickramarachchi",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.only(top: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: 10,
                          child: TextButton(
                            // color: Colors.red, // background
                            // textColor: Colors.white, // foreground
                            onPressed: () {
                              setState(() {
                                widget._isAll = true;
                                widget._isWidthrow = false;
                                widget._isDeposit = false;
                                widget._isTransaction = false;
                                print("isAll :");
                                print(widget._isAll);
                                print("_isWidthrow :");
                                print(widget._isWidthrow);
                                print("_isDeposit :");
                                print(widget._isDeposit);
                                print("_isTransaction :");
                                print(widget._isTransaction);
                              });
                            },
                            child: Text('All'),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: 10,
                          child: TextButton(
                            // color: Colors.red, // background
                            // textColor: Colors.white, // foreground
                            onPressed: () {
                              setState(() {
                                widget._isAll = false;
                                widget._isWidthrow = true;
                                widget._isDeposit = false;
                                widget._isTransaction = false;
                                print("isAll :");
                                print(widget._isAll);
                                print("_isWidthrow :");
                                print(widget._isWidthrow);
                                print("_isDeposit :");
                                print(widget._isDeposit);
                                print("_isTransaction :");
                                print(widget._isTransaction);
                              });
                            },
                            child: Text('Widthdrow'),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: 10,
                          child: TextButton(
                            // color: Colors.red, // background
                            // textColor: Colors.white, // foreground
                            onPressed: () {
                              setState(() {
                                widget._isAll = false;
                                widget._isWidthrow = false;
                                widget._isDeposit = true;
                                widget._isTransaction = false;
                                print("isAll :");
                                print(widget._isAll);
                                print("_isWidthrow :");
                                print(widget._isWidthrow);
                                print("_isDeposit :");
                                print(widget._isDeposit);
                                print("_isTransaction :");
                                print(widget._isTransaction);
                              });
                            },
                            child: Text('Deposit'),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 10,
                          child: TextButton(
                            // color: Colors.red, // background
                            // textColor: Colors.white, // foreground
                            onPressed: () {
                              setState(() {
                                widget._isAll = false;
                                widget._isWidthrow = false;
                                widget._isDeposit = false;
                                widget._isTransaction = true;
                                print("isAll :");
                                print(widget._isAll);
                                print("_isWidthrow :");
                                print(widget._isWidthrow);
                                print("_isDeposit :");
                                print(widget._isDeposit);
                                print("_isTransaction :");
                                print(widget._isTransaction);
                              });
                            },
                            child: Text('Transaction'),
                          ),
                        ))
                  ]),
                  Column(
                    children: [
                      Container(
                          width: 500,
                          height: 500,
                          child: ListVewBuilder(
                            token: widget.token,
                            isAll: widget._isAll,
                            isDeposit: widget._isDeposit,
                            isWidthrow: widget._isWidthrow,
                            isTransaction: widget._isTransaction,
                          ))
                    ],

                    // children: [
                    //   if (widget._isAll == true) ...[
                    //     Container(
                    //         height: 500,
                    //         width: 500,
                    //         // child: new ListVewBuilderTransaction(
                    //         child: ListVewBuilder(
                    //           token: widget.token,
                    //           isAll: widget._isAll,
                    //           isDeposit: widget._isDeposit,
                    //           isWidthrow: widget._isWidthrow,
                    //           isTransaction: widget._isTransaction,
                    //         )),
                    //   ] else if (widget._isWidthrow == true) ...[
                    //     Container(
                    //       height: 500,
                    //       width: 500,
                    //       child: Text("Widthrow"),
                    //     )
                    //     // HomeScreen(),
                    //     // StatsScreen(),
                    //   ] else if (widget._isDeposit == true) ...[
                    //     Container(
                    //         height: 500,
                    //         width: 500,
                    //         // child: new ListVewBuilderTransaction(
                    //         child: ListVewBuilder(
                    //           token: widget.token,
                    //           isAll: widget._isAll,
                    //           isDeposit: widget._isDeposit,
                    //           isWidthrow: widget._isWidthrow,
                    //           isTransaction: widget._isTransaction,
                    //         )),
                    //     // Container(
                    //     //   height: 500,
                    //     //   width: 500,
                    //     //   child: Text("deposite"),
                    //     // )
                    //     // HomeScreen(),
                    //     // StatsScreen(),
                    //   ] else if (widget._isTransaction == true) ...[
                    //     Container(
                    //       height: 500,
                    //       width: 500,
                    //       child: Text("Transaction"),
                    //     )
                    //     // HomeScreen(),
                    //     // StatsScreen(),
                    //   ],
                    // ],
                  ),
                  // Container(
                  //     height: 500,
                  //     width: 500,
                  //     // child: new ListVewBuilderTransaction(
                  //     child: new ListVewBuilder(
                  //       token: widget.token,isAll:widget. _isAll,isDeposit: widget._isDeposit,isWidthrow: widget._isWidthrow,isTransaction: widget._isTransaction,
                  //     )),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       getAllTransactions();
                  //     },
                  //     child: Text("getData")),
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
            const SizedBox(
              height: 18,
            ),
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
                  color: Color(0xff0293ee),
                  text: 'Income',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'Widthdrow',
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
              width: 28,
            ),
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
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        // case 2:
        //   return PieChartSectionData(
        //     color: const Color(0xff845bef),
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: const Color(0xffffffff)),
        //   );
        // case 3:
        //   return PieChartSectionData(
        //     color: const Color(0xff13d38e),
        //     value: 15,
        //     title: '15%',
        //     radius: radius,
        //     titleStyle: TextStyle(
        //         fontSize: fontSize,
        //         fontWeight: FontWeight.bold,
        //         color: const Color(0xffffffff)),
        //   );
        default:
          throw Error();
      }
    });
  }
}

class Transaction extends StatelessWidget {
  Transaction({Key? key, required this.token,this.userID}) : super(key: key);
  String? userID;
  String token;
  String _accNumber = '';
  String _amount = '';
  String _datetime = '';
  // String _dateTime = '';
  String _DessAccNumber = '';
  // AuthResponse? authresponse;
  var body = {};
  bool _loading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAuthenticate();
  // }

  void transaction() async {
    // setState(() {
    //   _loading = true;
    // });
    body["accNumber"] = _accNumber;
    body["amount"] = _amount;
    body["date_Time"] = _datetime;
    body["type"] = "t";
    body["destinationAccID"] = _DessAccNumber;
    print(_accNumber);
    print(_amount);
    print(_datetime);
    print(_DessAccNumber);
    print(token);
    // print(DateFormat.yMMMd().format(DateTime.now()));

    String bodyJason = json.encode(body);
    var response =
        await http.post(Uri.parse("http://localhost:8080/transaction"),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
              // "Authorization": "Bearer ${widget.token}",
              "Access-Control-Allow-Origin": "*"
            },
            body: bodyJason);

    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // BuildContext context;
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => customer(
      //               token: token,
      //             )));
      // Navigator.of(context).pushNamed("/SecondPage");
      Fluttertoast.showToast(
        msg: "Successfully Transfers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }
    else{Fluttertoast.showToast(
        msg: "Something Gone Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);}
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
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
                    "Transaction",
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
                          suffixIcon: const Icon(Icons.account_circle_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
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
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Transaction Amount',
                          suffixIcon: const Icon(Icons.monetization_on_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _amount = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Date/Time',
                          suffixIcon: const Icon(Icons.date_range_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _datetime = val;
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
                          labelText: 'Destination Account Number',
                          // counterText: 'Forgot password?',
                          suffixIcon: const Icon(Icons.account_circle_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _DessAccNumber = val;
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
                        child: const Center(child: Text('Transaction')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("Widraw Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        print("Destination Account Number : " + _DessAccNumber);
                        transaction();

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => customer()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),SizedBox(height: 20,),
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
                        child: const Center(child: Text('Cancel')),
                      ),
                      onPressed: () {
                        // // print(_accNumber)
                        // print("Account Number : " + _accNumber);
                        // print("Widraw Amount : " + _amount);
                        // print("Date/Time : " + _datetime);
                        // print("Destination Account Number : " + _DessAccNumber);
                        // transaction();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => customer(token: token,userID: userID.toString(),)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}

class Widthdraw extends StatelessWidget {
  // Widthdraw({Key? key,required this.token}) : super(key: key);
  Widthdraw({Key? key, required this.token, this.userID}) : super(key: key);
  String? userID;
  String token;
  String _accNumber = '';
  String _amount = '';
  String _datetime = '';
  // String _dateTime = '';
  String _DessAccNumber = '0';
  // AuthResponse? authresponse;
  var body = {};
  bool _loading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAuthenticate();
  // }

  void widthdraw() async {
    // setState(() {
    //   _loading = true;
    // });
    body["accNumber"] = _accNumber;
    body["amount"] = _amount;
    body["date_Time"] = _datetime;
    body["type"] = "w";
    body["destinationAccID"] = 0;
    print("A"+_accNumber);
    print("a"+_amount);
    print("d"+_datetime);
    print("d"+_DessAccNumber);
    print(token);
    // print(DateFormat.yMMMd().format(DateTime.now()));

    String bodyJason = json.encode(body);
    var response =
        await http.post(Uri.parse("http://localhost:8080/deposite"),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
              // "Authorization": "Bearer ${widget.token}",
              "Access-Control-Allow-Origin": "*"
            },
            body: bodyJason);

    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // BuildContext context;
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => customer(
      //               token: token,
      //             )));
      // Navigator.of(context).pushNamed("/SecondPage");
      Fluttertoast.showToast(
        msg: "Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }
    else{Fluttertoast.showToast(
        msg: "Something Gone Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);}
    
  }

  @override
  Widget build(BuildContext context) {
    // String _accNumber = '';
    // String _amount = '';
    // String _datetime = '';
    // // final String _dateTime;
    // String _DessAccNumber = "0";
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
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
                    "Widthdraw",
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
                          suffixIcon: const Icon(Icons.account_circle_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
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
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Widthdraw Amount',
                          suffixIcon: const Icon(Icons.monetization_on_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _amount = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Date/Time',
                          suffixIcon: const Icon(Icons.date_range_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _datetime = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ignore: sized_box_for_whitespace
                  // Container(
                  //   width: 500,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         labelText: 'Destination Account Number',
                  //         // counterText: 'Forgot password?',
                  //         suffixIcon: const Icon(Icons.account_circle_outlined,
                  //             color: Colors.grey),
                  //         fillColor: Colors.blueGrey[50],
                  //         filled: true,
                  //         labelStyle: const TextStyle(fontSize: 12),
                  //         contentPadding: const EdgeInsets.only(left: 30),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               color: Color.fromARGB(255, 0, 128, 255)),
                  //           borderRadius: BorderRadius.circular(15),
                  //         )),
                  //     onChanged: (val) {
                  //       _DessAccNumber = val;
                  //     },
                  //   ),
                  // ),
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
                        child: const Center(child: Text('Widthdraw')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("Widraw Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        print("Destination Account Number : " + _DessAccNumber);
                        widthdraw();
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => customer(token: token,)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        child: const Center(child: Text('Cancel')),
                      ),
                      onPressed: () {
                        // // print(_accNumber)
                        // print("Account Number : " + _accNumber);
                        // print("Widraw Amount : " + _amount);
                        // print("Date/Time : " + _datetime);
                        // print("Destination Account Number : " + _DessAccNumber);
                        // transaction();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => customer(token: token,userID: userID.toString(),)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}

class deposite extends StatelessWidget {
  // deposite({Key? key,required this.token}) : super(key: key);
  deposite({Key? key, required this.token,this.userID}) : super(key: key);
  String? userID;
  String token;
  String _accNumber = '';
  String _amount = '';
  String _datetime = '';
  // String _dateTime = '';
  String _DessAccNumber = '0';
  // AuthResponse? authresponse;
  var body = {};
  bool _loading = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getAuthenticate();
  // }

  void deposite1() async {
    // setState(() {
    //   _loading = true;
    // });
    body["accNumber"] = _accNumber;
    body["amount"] = _amount;
    body["date_Time"] = _datetime;
    body["type"] = "d";
    body["destinationAccID"] = 0;
    print("A"+_accNumber);
    print("a"+_amount);
    print("d"+_datetime);
    print("d"+_DessAccNumber);
    print(token);
    // print(DateFormat.yMMMd().format(DateTime.now()));

    String bodyJason = json.encode(body);
    var response =
        await http.post(Uri.parse("http://localhost:8080/deposite"),
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
              // "Authorization": "Bearer ${widget.token}",
              "Access-Control-Allow-Origin": "*"
            },
            body: bodyJason);

    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      // BuildContext context;
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => customer(
      //               token: token,
      //             )));
      // Navigator.of(context).pushNamed("/SecondPage");
      Fluttertoast.showToast(
        msg: "Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }
    else{Fluttertoast.showToast(
        msg: "Something Gone Wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);}
    
  }

  @override
  Widget build(BuildContext context) {
    // String _accNumber = '';
    // String _amount = '';
    // String _datetime = '';
    // // final String _dateTime;
    // String _DessAccNumber = '';
    return Scaffold(
        body: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
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
                    "Deposite",
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
                          suffixIcon: const Icon(Icons.account_circle_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
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
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Deposite Amount',
                          suffixIcon: const Icon(Icons.monetization_on_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _amount = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 500,
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: 'Date/Time',
                          suffixIcon: const Icon(Icons.date_range_outlined,
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
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 128, 255)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onChanged: (val) {
                        _datetime = val;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ignore: sized_box_for_whitespace
                  // Container(
                  //   width: 500,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         labelText: 'Destination Account Number',
                  //         // counterText: 'Forgot password?',
                  //         suffixIcon: const Icon(Icons.account_circle_outlined,
                  //             color: Colors.grey),
                  //         fillColor: Colors.blueGrey[50],
                  //         filled: true,
                  //         labelStyle: const TextStyle(fontSize: 12),
                  //         contentPadding: const EdgeInsets.only(left: 30),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(color: Colors.grey),
                  //           borderRadius: BorderRadius.circular(15),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               color: Color.fromARGB(255, 0, 128, 255)),
                  //           borderRadius: BorderRadius.circular(15),
                  //         )),
                  //     onChanged: (val) {
                  //       _DessAccNumber = val;
                  //     },
                  //   ),
                  // ),
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
                        child: const Center(child: Text('Deposite')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("deposite Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        // print("Destination Account Number : "+_DessAccNumber);
                        deposite1();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => customer(token: token,userID: userID.toString(),)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                        child: const Center(child: Text('Cancel')),
                      ),
                      onPressed: () {
                        // // print(_accNumber)
                        // print("Account Number : " + _accNumber);
                        // print("Widraw Amount : " + _amount);
                        // print("Date/Time : " + _datetime);
                        // print("Destination Account Number : " + _DessAccNumber);
                        // transaction();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => customer(token: token,userID: userID.toString(),)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}

class ListVewBuilder extends StatefulWidget {
  ListVewBuilder(
      {Key? key,
      this.token,
      required this.isAll,
      required this.isWidthrow,
      required this.isDeposit,
      required this.isTransaction})
      : super(key: key);
  String? token;
  bool isAll = true;
  bool isWidthrow = false;
  bool isDeposit = false;
  bool isTransaction = false;
  @override
  State<ListVewBuilder> createState() => _ListVewBuilderState();
}

class _ListVewBuilderState extends State<ListVewBuilder> {
  SingleuserResponse? trresponse;
  bool _loading = false;
  List<SingleuserResponse>? widthdrowList = [];
  List<SingleuserResponse>? depositList = [];
  List<SingleuserResponse>? transactionList = [];
  List<SingleuserResponse>? all = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTransactions();
  }

  void getAllTransactions() async {
    setState(() {
      _loading = true;
    });

    // print("$widget");
    var response = await http.post(
      Uri.parse("http://localhost:8080/usebyid/6"),
      headers: {
        "Authorization": "Bearer ${widget.token}",
        // "Authorization": "Bearer ${widget.token}",
        "Access-Control-Allow-Origin": "*"
      },
    );
    // print("deposite :");
    //   print(depositList!);
    //   print("Widthrow :");
    //   print(widthdrowList!);
    //   print("transaction :");
    //   print(transactionList!);
    //   print("all :");
    //   print(all!);
    print("Status Code");
    print(response.statusCode);
    if (response.statusCode == 200) {
      trresponse = singleuserResponseFromJson(response.body);
      setState(() {});
      print(trresponse!.accounts![0].transactins!.length);
      print(trresponse!.accounts!.length);
      for (int i = 0; i < trresponse!.accounts!.length; i++) {
        print("Inside the account");
        for (int j = 0; j < trresponse!.accounts![i].transactins!.length; j++) {
          // print("inside the transaction");
          // print(trresponse!.accounts![i].transactins![j].type.toString());
          if (trresponse!.accounts![i].transactins![j].type.toString() == "d") {
            depositList?.add(trresponse!);
          } else if (trresponse!.accounts![i].transactins![j].type.toString() ==
              "w") {
            // print(trresponse!);
            widthdrowList?.add(trresponse!);
          } else if (trresponse!.accounts![i].transactins![j].type.toString() ==
              "t") {
            // print(trresponse!.accounts![i].transactins![j].type.toString());
            transactionList?.add(trresponse!);
            // print(transactionList![0].accounts![0].transactins![0].type);
          }
          all?.add(trresponse!);
        }
      }
      // for (int i = 0; i <= trresponse!.accounts!.length; i++) {
      //   print(trresponse!.accounts![0].transactins![0].type);
      //   if (trresponse!.accounts![i].transactins![i].type.toString() == "Type.D") {
      //     // print(trresponse![i]);
      //     depositList?.add(trresponse!);
      //   }
      // if (trresponse!.accounts![i].transactins![i].type.toString() == "Type.W") {
      //   // print(trresponse![i]);
      //   widthdrowList?.add(trresponse!);
      // }
      // if (trresponse!.accounts![i].transactins![i].type.toString() == "Type.T") {
      //   // print(trresponse![i]);
      //   transactionList?.add(trresponse!);
      // }
      // }
      // print("deposite :");
      // print(depositList![0].accounts![0].transactins![0].type);
      // print("Widthrow :");
      // print(widthdrowList![0].accounts![0].transactins![0].type);
      // print("transaction :");
      // print(transactionList![0].accounts![0].transactins![0].type);
      // print("all :");
      // print(all!);
      Timer(const Duration(seconds: 1), () {
        setState(() {
          _loading = false;
        });
      });
      // print("isAll :");
      // print(widget.isAll);
      // print("_isWidthrow :");
      // print(widget.isWidthrow);
      // print("_isDeposit :");
      // print(widget.isDeposit);
      // print("_isTransaction :");
      // print(widget.isTransaction);
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
          if (_loading)
            Container(
              padding: const EdgeInsets.all(200),
              child: const SpinKitRing(color: Colors.amber),
              // child: CircularProgressIndicator(
              // color: Colors.red,)
            )
          else
            Container(
                width: 500,
                height: 500,
                child: (() {
                  if (widget.isDeposit == true) {
                    return ListView.builder(
                        itemCount: depositList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: const Icon(Icons.list),
                              trailing: Container(
                                  child: Column(
                                children: [
                                  // Text(trresponse![index].accNumber.toString()),
                                  TextButton(
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.black87,
                                      )),
                                ],
                              )),
                              title: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(depositList![index]
                                        .accounts![index]
                                        .transactins![index]
                                        .accNumber
                                        .toString()),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(depositList![index]
                                        .accounts![index]
                                        .transactins![index]
                                        .amount
                                        .toString()),
                                  )
                                ],
                              ),
                              subtitle: Text("Date/Time: " +
                                  depositList![index]
                                      .accounts![index]
                                      .transactins![index]
                                      .dateTime
                                      .toString()));
                        });
                  } else if (widget.isWidthrow == true) {
                    return ListView.builder(
                        itemCount: widthdrowList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: const Icon(Icons.list),
                              trailing: Container(
                                  child: Column(
                                children: [
                                  // Text(trresponse![index].accNumber.toString()),
                                  // TextButton(
                                  //     onPressed: () {},
                                  //     child: const Icon(
                                  //       Icons.person,
                                  //       color: Colors.black87,
                                  //     )),
                                ],
                              )),
                              title: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(widthdrowList![index]
                                        .accounts![index]
                                        .transactins![index]
                                        .accNumber
                                        .toString()),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      widthdrowList![index]
                                          .accounts![index]
                                          .transactins![index]
                                          .amount
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 25),
                                      textAlign: TextAlign.right,
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Text("Date/Time: " +
                                  widthdrowList![index]
                                      .accounts![index]
                                      .transactins![index]
                                      .dateTime
                                      .toString()));
                        });
                  } else if (widget.isTransaction == true) {
                    return ListView.builder(
                        itemCount: transactionList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const Icon(Icons.list),
                            trailing: Container(
                                child: Column(
                              children: [
                                // Row(children: [Text(trresponse![index].accNumber.toString()), ],),
                                // TextButton(
                                //     onPressed: () {},
                                //     child: const Icon(
                                //       Icons.person,
                                //       color: Colors.black87,
                                //     )),
                              ],
                            )),
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(transactionList![index]
                                      .accounts![index]
                                      .transactins![index]
                                      .destinationAccId
                                      .toString()),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    transactionList![index]
                                        .accounts![index]
                                        .transactins![index]
                                        .amount
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 25),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text("Date/Time: " +
                                transactionList![index]
                                    .accounts![index]
                                    .transactins![index]
                                    .dateTime
                                    .toString()),
                          );
                        });
                  } else if (widget.isAll) {
                    return ListView.builder(
                        itemCount: all!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const Icon(Icons.list),
                            trailing: Container(
                                child: Column(
                              children: [
                                // Row(children: [Text(trresponse![index].accNumber.toString()), ],),
                                // TextButton(
                                //     onPressed: () {},
                                    // child: const Icon(
                                    //   Icons.person,
                                    //   color: Colors.black87,
                                    // )),
                              ],
                            )),
                            title: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(all![index]
                                      .accounts![0]
                                      .transactins![index]
                                      .accNumber
                                      .toString()),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    all![index]
                                        .accounts![0]
                                        .transactins![index]
                                        .amount
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 25),
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ],
                            ),
                            subtitle: Text("Date/Time: " +
                                all![index]
                                    .accounts![0]
                                    .transactins![index]
                                    .dateTime
                                    .toString()),
                          );
                        });
                  }
                }()))
        ],
      )),
    );
  }
}

// --------------------------CustomerAll------------------------------------------------------------------------
