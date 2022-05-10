import 'package:abcbank/main.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.black,
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
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Table(
                      border: TableBorder.all(),
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
                  )
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
                SizedBox(height: 200,),
                Container( child: PieChartSample1(),width: 300,height: 300,)        
              ],
            ),
          )
        ],
      ),
      // SfCircularChart(),
    );
  }
}

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
                  _menuItem(title: 'Home')
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
                  _menuItem(title: 'Transaction')
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
                  _menuItem(title: 'Transaction')
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
                    child: const Text(
                      "Deshan Salitha",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
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

class PieChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  // late int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: PageView(
        children: <Widget>[
          PieChart(PieChartData(
            sections: data,
          ),)
        ],
      )),
    );
  }
}

List<PieChartSectionData> data = [
  PieChartSectionData(title: '70%', color: Colors.green[600],value: 70),
  PieChartSectionData(title: '30%', color: Colors.red[400],value: 30),
];