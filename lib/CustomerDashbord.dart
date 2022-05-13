import 'package:abcbank/main.dart';
import 'package:abcbank/model/user_repose.dart';
import 'package:abcbank/navbar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';
import 'package:http/http.dart' as http;

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);
  List<UserResponse>? userresponse;
  void getAllUsers() async {
    var response =
        await http.get(Uri.parse("http://localhost:8080/userall"));
    print("Status Code");
    print(response.statusCode);
    // if(response.statusCode == 200){
    //    userresponse = userResponseFromJson(response.body);
    //    for(int i =0 ; i < userresponse!.length; i++){
    //      print(userresponse![i].name);
    //    }
    // }
  }

  

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
                    Sidebar(),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Table(
                      // border: TableBorder.all(),
                      children: const [
                        TableRow(children: [
                          Text(
                            "TID",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Amount",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Date/Time",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Transaction Type",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Destination Account Number",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            "1",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "112",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "1999-03-22 10:06:07",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Deposit",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "None",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            "2",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "112",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "1999-03-22 10:06:07",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Widthdrow",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "None",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            "3",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "112",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "1999-03-22 10:06:07",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Deposit",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "None",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        TableRow(children: [
                          Text(
                            "4",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "112",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "1999-03-22 10:06:07",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Widthrow",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "None",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        getAllUsers();
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
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _accNumber = '';
    String _amount = '';
    String _datetime = '';
    // final String _dateTime;
    String _DessAccNumber = '';
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
                        child: const Center(child: Text('Widthdraw')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("Widraw Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        print("Destination Account Number : " + _DessAccNumber);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
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
  const Widthdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _accNumber = '';
    String _amount = '';
    String _datetime = '';
    // final String _dateTime;
    String _DessAccNumber = '';
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
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
  const deposite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _accNumber = '';
    String _amount = '';
    String _datetime = '';
    // final String _dateTime;
    String _DessAccNumber = '';
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
                        child: const Center(child: Text('Widthdraw')),
                      ),
                      onPressed: () {
                        // print(_accNumber)
                        print("Account Number : " + _accNumber);
                        print("deposite Amount : " + _amount);
                        print("Date/Time : " + _datetime);
                        // print("Destination Account Number : "+_DessAccNumber);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
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
