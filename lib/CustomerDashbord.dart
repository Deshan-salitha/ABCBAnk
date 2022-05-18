// import 'dart:async';
// import 'dart:html';
// import 'package:abcbank/main.dart';
// import 'package:abcbank/model/transactionResponse.dart';
// import 'package:abcbank/model/user_repose.dart';
// import 'package:abcbank/navbar/sidebar.dart';
// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'indicator.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_animated_button/flutter_animated_button.dart';

// class CustomerHome extends StatelessWidget {
//   CustomerHome({Key? key, this.token}) : super(key: key);
//   String? token;
//   bool _isAll = true;
//   bool _isWidthrow = false;
//   bool _isDeposit = false;
//   bool _isTransaction = false;
//   // List<TransactionResponse>? trresponse;
//   // // TransactionResponse trresponse;
//   // void getAllTransactions() async {
//   //   print("Token" + token.toString());
//   //   var response = await http
//   //       .get(Uri.parse("http://localhost:8080/alltransactions"), headers: {
//   //     "Authorization": "Bearer $token",
//   //     "Access-Control-Allow-Origin": "*"
//   //   });
//   //   print("Status Code");
//   //   // print(response.statusCode);
//   //   print("before if");
//   //   if (response.statusCode == 200) {
//   //     print("object");
//   //     trresponse = transactionResponseFromJson(response.body);
//   //     for (int i = 0; i < trresponse!.length; i++) {
//   //       print(trresponse![i].tId);
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Expanded(
//               flex: 3,
//               child: Container(
//                 color: Colors.black87,
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.all(50),
//                       child: const Text(
//                         "ABC Bank",
//                         style: TextStyle(color: Colors.white, fontSize: 30),
//                       ),
//                     ),
//                     Sidebar(),
//                   ],
//                 ),
//               )),
//           Expanded(
//               flex: 4,
//               child: Container(
//                 color: Colors.white,
//                 child: Column(children: [
//                   Container(
//                     child: Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             'images/card.jpg',
//                             width: 300,
//                           ),
//                         ),
//                         const Text(
//                           "\n\n\n\n\n     0123    4567    8901    2345",
//                           style: TextStyle(fontSize: 20, color: Colors.white),
//                         ),
//                         const Text(
//                           "\n\n\n\n\n\n\n\n  W.A.S.R.Deshan Wickramarachchi",
//                           style: TextStyle(fontSize: 15, color: Colors.white),
//                         )
//                       ],
//                     ),
//                     padding: const EdgeInsets.only(top: 20),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Row(children: [
//                     Expanded(
//                         flex: 1,
//                         child: Container(
//                           padding: EdgeInsets.only(bottom: 10),
//                           width: 10,
//                           child: TextButton(
//                             // color: Colors.red, // background
//                             // textColor: Colors.white, // foreground
//                             onPressed: () {
//                               setState
//                               bool _isAll = true;
//                               bool _isWidthrow = false;
//                               bool _isDeposit = false;
//                               bool _isTransaction = false;
//                               print("isAll :");
//                               print(_isAll);
//                               print("_isWidthrow :");
//                               print(_isWidthrow);
//                               print("_isDeposit :");
//                               print(_isDeposit);
//                               print("_isTransaction :");
//                               print(_isTransaction);
//                             },
//                             child: Text('All'),
//                           ),
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: Container(
//                           padding: EdgeInsets.only(bottom: 10),
//                           width: 10,
//                           child: TextButton(
//                             // color: Colors.red, // background
//                             // textColor: Colors.white, // foreground
//                             onPressed: () {
//                               bool _isAll = false;
//                               bool _isWidthrow = true;
//                               bool _isDeposit = false;
//                               bool _isTransaction = false;
//                               print("isAll :");
//                               print(_isAll);
//                               print("_isWidthrow :");
//                               print(_isWidthrow);
//                               print("_isDeposit :");
//                               print(_isDeposit);
//                               print("_isTransaction :");
//                               print(_isTransaction);
//                             },
//                             child: Text('Widthdrow'),
//                           ),
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: Container(
//                           padding: EdgeInsets.only(bottom: 10),
//                           width: 10,
//                           child: TextButton(
//                             // color: Colors.red, // background
//                             // textColor: Colors.white, // foreground
//                             onPressed: () {
//                               bool _isAll = false;
//                               bool _isWidthrow = false;
//                               bool _isDeposit = true;
//                               bool _isTransaction = false;
//                               print("isAll :");
//                               print(_isAll);
//                               print("_isWidthrow :");
//                               print(_isWidthrow);
//                               print("_isDeposit :");
//                               print(_isDeposit);
//                               print("_isTransaction :");
//                               print(_isTransaction);
//                             },
//                             child: Text('Deposit'),
//                           ),
//                         )),
//                     Expanded(
//                         flex: 1,
//                         child: Container(
//                           width: 10,
//                           child: TextButton(
//                             // color: Colors.red, // background
//                             // textColor: Colors.white, // foreground
//                             onPressed: () {
//                               bool _isAll = false;
//                               bool _isWidthrow = false;
//                               bool _isDeposit = false;
//                               bool _isTransaction = true;
//                               print("isAll :");
//                               print(_isAll);
//                               print("_isWidthrow :");
//                               print(_isWidthrow);
//                               print("_isDeposit :");
//                               print(_isDeposit);
//                               print("_isTransaction :");
//                               print(_isTransaction);
//                             },
//                             child: Text('Transaction'),
//                           ),
//                         ))
//                   ]),
//                   Container(
//                       height: 500,
//                       width: 500,
//                       // child: new ListVewBuilderTransaction(
//                       child: new ListVewBuilder(
//                         token: token,isAll: _isAll,isDeposit: _isDeposit,isWidthrow: _isWidthrow,isTransaction: _isTransaction,
//                       )),
//                   // ElevatedButton(
//                   //     onPressed: () {
//                   //       getAllTransactions();
//                   //     },
//                   //     child: Text("getData")),
//                 ]),
//               )),
//           Expanded(
//             flex: 5,
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(top: 20),
//                   alignment: Alignment.topLeft,
//                   color: Colors.white,
//                   child: Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                           'images/ad.jpg',
//                           // width: 300,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Color.fromARGB(255, 230, 217, 217),
//                           spreadRadius: 10,
//                           blurRadius: 20,
//                         )
//                       ]),
//                   child: PieChartSample2(),
//                   width: 500,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//       // SfCircularChart(),
//     );
//   }
// }

// class PieChartSample2 extends StatefulWidget {
//   const PieChartSample2({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => PieChart2State();
// }

// class PieChart2State extends State {
//   int touchedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.3,
//       child: Card(
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             const SizedBox(
//               height: 18,
//             ),
//             Expanded(
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: PieChart(
//                   PieChartData(
//                       pieTouchData: PieTouchData(touchCallback:
//                           (FlTouchEvent event, pieTouchResponse) {
//                         setState(() {
//                           if (!event.isInterestedForInteractions ||
//                               pieTouchResponse == null ||
//                               pieTouchResponse.touchedSection == null) {
//                             touchedIndex = -1;
//                             return;
//                           }
//                           touchedIndex = pieTouchResponse
//                               .touchedSection!.touchedSectionIndex;
//                         });
//                       }),
//                       borderData: FlBorderData(
//                         show: false,
//                       ),
//                       sectionsSpace: 0,
//                       centerSpaceRadius: 40,
//                       sections: showingSections()),
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const <Widget>[
//                 Indicator(
//                   color: Color(0xff0293ee),
//                   text: 'Income',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Indicator(
//                   color: Color(0xfff8b250),
//                   text: 'Widthdrow',
//                   isSquare: true,
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 // Indicator(
//                 //   color: Color(0xff845bef),
//                 //   text: 'Third',
//                 //   isSquare: true,
//                 // ),
//                 // SizedBox(
//                 //   height: 4,
//                 // ),
//                 // Indicator(
//                 //   color: Color(0xff13d38e),
//                 //   text: 'Fourth',
//                 //   isSquare: true,
//                 // ),
//                 // SizedBox(
//                 //   height: 18,
//                 // ),
//               ],
//             ),
//             const SizedBox(
//               width: 28,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(2, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 25.0 : 16.0;
//       final radius = isTouched ? 60.0 : 50.0;
//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: const Color(0xff0293ee),
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         case 1:
//           return PieChartSectionData(
//             color: const Color(0xfff8b250),
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//           );
//         // case 2:
//         //   return PieChartSectionData(
//         //     color: const Color(0xff845bef),
//         //     value: 15,
//         //     title: '15%',
//         //     radius: radius,
//         //     titleStyle: TextStyle(
//         //         fontSize: fontSize,
//         //         fontWeight: FontWeight.bold,
//         //         color: const Color(0xffffffff)),
//         //   );
//         // case 3:
//         //   return PieChartSectionData(
//         //     color: const Color(0xff13d38e),
//         //     value: 15,
//         //     title: '15%',
//         //     radius: radius,
//         //     titleStyle: TextStyle(
//         //         fontSize: fontSize,
//         //         fontWeight: FontWeight.bold,
//         //         color: const Color(0xffffffff)),
//         //   );
//         default:
//           throw Error();
//       }
//     });
//   }
// }

// class Transaction extends StatelessWidget {
//   const Transaction({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _accNumber = '';
//     String _amount = '';
//     String _datetime = '';
//     // final String _dateTime;
//     String _DessAccNumber = '';
//     return Scaffold(
//         body: Row(
//       children: [
//         Expanded(
//             flex: 4,
//             child: Container(
//               child: Column(
//                 children: [
//                   const Text(
//                     "ABC Bank",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 50,
//                     ),
//                   ),
//                   // ignore: prefer_const_constructors
//                   SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Transaction",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Account Number',
//                           suffixIcon: const Icon(Icons.account_circle_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _accNumber = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Transaction Amount',
//                           suffixIcon: const Icon(Icons.monetization_on_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _amount = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Date/Time',
//                           suffixIcon: const Icon(Icons.date_range_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _datetime = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // ignore: sized_box_for_whitespace
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Destination Account Number',
//                           // counterText: 'Forgot password?',
//                           suffixIcon: const Icon(Icons.account_circle_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _DessAccNumber = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     width: 500,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 209, 196, 233),
//                             spreadRadius: 10,
//                             blurRadius: 20,
//                           )
//                         ]),
//                     child: ElevatedButton(
//                       child: Container(
//                         width: 500,
//                         height: 50,
//                         child: const Center(child: Text('Widthdraw')),
//                       ),
//                       onPressed: () {
//                         // print(_accNumber)
//                         print("Account Number : " + _accNumber);
//                         print("Widraw Amount : " + _amount);
//                         print("Date/Time : " + _datetime);
//                         print("Destination Account Number : " + _DessAccNumber);
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CustomerHome()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.deepPurple,
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ],
//     ));
//   }
// }

// class Widthdraw extends StatelessWidget {
//   const Widthdraw({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _accNumber = '';
//     String _amount = '';
//     String _datetime = '';
//     // final String _dateTime;
//     String _DessAccNumber = '';
//     return Scaffold(
//         body: Row(
//       children: [
//         Expanded(
//             flex: 4,
//             child: Container(
//               child: Column(
//                 children: [
//                   const Text(
//                     "ABC Bank",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 50,
//                     ),
//                   ),
//                   // ignore: prefer_const_constructors
//                   SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Widthdraw",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Account Number',
//                           suffixIcon: const Icon(Icons.account_circle_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _accNumber = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Widthdraw Amount',
//                           suffixIcon: const Icon(Icons.monetization_on_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _amount = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Date/Time',
//                           suffixIcon: const Icon(Icons.date_range_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _datetime = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // ignore: sized_box_for_whitespace
//                   // Container(
//                   //   width: 500,
//                   //   child: TextField(
//                   //     decoration: InputDecoration(
//                   //         labelText: 'Destination Account Number',
//                   //         // counterText: 'Forgot password?',
//                   //         suffixIcon: const Icon(Icons.account_circle_outlined,
//                   //             color: Colors.grey),
//                   //         fillColor: Colors.blueGrey[50],
//                   //         filled: true,
//                   //         labelStyle: const TextStyle(fontSize: 12),
//                   //         contentPadding: const EdgeInsets.only(left: 30),
//                   //         enabledBorder: OutlineInputBorder(
//                   //           borderSide: const BorderSide(color: Colors.grey),
//                   //           borderRadius: BorderRadius.circular(15),
//                   //         ),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderSide: const BorderSide(
//                   //               color: Color.fromARGB(255, 0, 128, 255)),
//                   //           borderRadius: BorderRadius.circular(15),
//                   //         )),
//                   //     onChanged: (val) {
//                   //       _DessAccNumber = val;
//                   //     },
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     width: 500,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 209, 196, 233),
//                             spreadRadius: 10,
//                             blurRadius: 20,
//                           )
//                         ]),
//                     child: ElevatedButton(
//                       child: Container(
//                         width: 500,
//                         height: 50,
//                         child: const Center(child: Text('Widthdraw')),
//                       ),
//                       onPressed: () {
//                         // print(_accNumber)
//                         print("Account Number : " + _accNumber);
//                         print("Widraw Amount : " + _amount);
//                         print("Date/Time : " + _datetime);
//                         print("Destination Account Number : " + _DessAccNumber);
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CustomerHome()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.deepPurple,
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ],
//     ));
//   }
// }

// class deposite extends StatelessWidget {
//   const deposite({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String _accNumber = '';
//     String _amount = '';
//     String _datetime = '';
//     // final String _dateTime;
//     String _DessAccNumber = '';
//     return Scaffold(
//         body: Row(
//       children: [
//         Expanded(
//             flex: 4,
//             child: Container(
//               child: Column(
//                 children: [
//                   const Text(
//                     "ABC Bank",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 50,
//                     ),
//                   ),
//                   // ignore: prefer_const_constructors
//                   SizedBox(
//                     height: 20,
//                   ),
//                   const Text(
//                     "Deposite",
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Account Number',
//                           suffixIcon: const Icon(Icons.account_circle_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _accNumber = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Deposite Amount',
//                           suffixIcon: const Icon(Icons.monetization_on_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _amount = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 500,
//                     child: TextField(
//                       decoration: InputDecoration(
//                           labelText: 'Date/Time',
//                           suffixIcon: const Icon(Icons.date_range_outlined,
//                               color: Colors.grey),
//                           fillColor: Colors.blueGrey[50],
//                           filled: true,
//                           labelStyle: const TextStyle(fontSize: 12),
//                           contentPadding: const EdgeInsets.only(left: 30),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                                 color: Color.fromARGB(255, 0, 128, 255)),
//                             borderRadius: BorderRadius.circular(15),
//                           )),
//                       onChanged: (val) {
//                         _datetime = val;
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   // ignore: sized_box_for_whitespace
//                   // Container(
//                   //   width: 500,
//                   //   child: TextField(
//                   //     decoration: InputDecoration(
//                   //         labelText: 'Destination Account Number',
//                   //         // counterText: 'Forgot password?',
//                   //         suffixIcon: const Icon(Icons.account_circle_outlined,
//                   //             color: Colors.grey),
//                   //         fillColor: Colors.blueGrey[50],
//                   //         filled: true,
//                   //         labelStyle: const TextStyle(fontSize: 12),
//                   //         contentPadding: const EdgeInsets.only(left: 30),
//                   //         enabledBorder: OutlineInputBorder(
//                   //           borderSide: const BorderSide(color: Colors.grey),
//                   //           borderRadius: BorderRadius.circular(15),
//                   //         ),
//                   //         focusedBorder: OutlineInputBorder(
//                   //           borderSide: const BorderSide(
//                   //               color: Color.fromARGB(255, 0, 128, 255)),
//                   //           borderRadius: BorderRadius.circular(15),
//                   //         )),
//                   //     onChanged: (val) {
//                   //       _DessAccNumber = val;
//                   //     },
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   Container(
//                     width: 500,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color.fromARGB(255, 209, 196, 233),
//                             spreadRadius: 10,
//                             blurRadius: 20,
//                           )
//                         ]),
//                     child: ElevatedButton(
//                       child: Container(
//                         width: 500,
//                         height: 50,
//                         child: const Center(child: Text('Widthdraw')),
//                       ),
//                       onPressed: () {
//                         // print(_accNumber)
//                         print("Account Number : " + _accNumber);
//                         print("deposite Amount : " + _amount);
//                         print("Date/Time : " + _datetime);
//                         // print("Destination Account Number : "+_DessAccNumber);
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CustomerHome()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                           primary: Colors.deepPurple,
//                           onPrimary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ],
//     ));
//   }
// }

// class ListVewBuilder extends StatefulWidget {
//   ListVewBuilder({Key? key, this.token,required this.isAll,required this.isWidthrow,required this.isDeposit,required this.isTransaction}) : super(key: key);
//   String? token;
//   bool isAll = true;
//   bool isWidthrow = false;
//   bool isDeposit = false;
//   bool isTransaction = false;
//   @override
//   State<ListVewBuilder> createState() => _ListVewBuilderState();
// }

// class _ListVewBuilderState extends State<ListVewBuilder> {
//   List<TransactionResponse>? trresponse;
//   bool _loading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getAllTransactions();
//   }

//   void getAllTransactions() async {
//     setState(() {
//       _loading = true;
//     });
//     // print("$widget");
//     var response = await http.get(
//       Uri.parse("http://localhost:8080/alltransactions"),
//       headers: {
//         "Authorization": "Bearer ${widget.token}",
//         // "Authorization": "Bearer ${widget.token}",
//         "Access-Control-Allow-Origin": "*"
//       },
//     );
//     print("Status Code");
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       trresponse = transactionResponseFromJson(response.body);
//       setState(() {});
//       for (int i = 0; i < trresponse!.length; i++) {
//         print(trresponse![i].tId);
//       }
//       Timer(Duration(seconds: 3), () {
//         setState(() {
//           _loading = false;
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("ListView.builder"),
//       // ),
//       body: Container(
//           child: Column(
//         children: [
//           _loading
//               ? Container(
//                   padding: EdgeInsets.all(200),
//                   child: SpinKitRing(color: Colors.amber),
//                   // child: CircularProgressIndicator(
//                   // color: Colors.red,)
//                 )
//               : Container(
//                   width: 500,
//                   height: 500,
//                   child: ListView.builder(
//                       itemCount: trresponse!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                             leading: Icon(Icons.list),
//                             trailing: Container(
//                                 child: Column(
//                               children: [
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Icon(
//                                       Icons.person,
//                                       color: Colors.black87,
//                                     ))
//                               ],
//                             )),
//                             // Text(trresponse![index]
//                             //     .ownerAcc!
//                             //     .owner!
//                             //     .email
//                             //     .toString())
//                             title: widget.isAll? Text("all"): widget.isWidthrow? Text("Widthdrow"): widget.isDeposit? Text("deposit") : Text("Transaction"));
//                       }),
//                 )
//         ],
//       )),
//       // body: ListView.builder(
//       //     itemCount: userresponse!.body!.length,
//       //     itemBuilder: (BuildContext context, int index) {
//       //       return ListTile(
//       //           leading: Icon(Icons.list),
//       //           trailing: Text(
//       //             "GFG",
//       //             style: TextStyle(color: Colors.green, fontSize: 15),
//       //           ),
//       //           title: Text(userresponse!.body![index].ufname.toString()));
//       //     }),
//     );
//   }
// }

// // --------------------------CustomerAll------------------------------------------------------------------------