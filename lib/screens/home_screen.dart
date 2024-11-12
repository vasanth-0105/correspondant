import 'package:correspondant_application/screens/announcement_screen.dart';
import 'package:correspondant_application/screens/accounts_screen.dart';
import 'package:correspondant_application/screens/attendence_screen.dart';
import 'package:correspondant_application/screens/fee_screen.dart';
import 'package:correspondant_application/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../comman_color/common_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var h, w;
  final List<AttendencedataType> attendenceData = [
    AttendencedataType('2022', 3500, Colors.blue),
    AttendencedataType('2023', 2050, Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(
        title: "Dashboard",
        color: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: h * 0.045,
              decoration: const BoxDecoration(color: primaryColor),
            ),
            list(text1: "Menu", size: h * 0.03, clr: primaryColor),
            list(icon: const Icon(Icons.home), text1: "Home"),
            const Spacer(),
            list(icon: const Icon(Icons.logout), text1: "Logout"),
            SizedBox(
              height: h * 0.01,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              children: [crd(clr: primaryColor, txt: "Welcome")],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    Container(
                      height: h * 0.118,
                    ),
                    Container(
                      height: h * 0.125,
                      width: w * 0.55,
                      margin: EdgeInsets.only(top: h * 0.01),
                      padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF0474FD),
                            Color(0xFF00F3FF),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(h * 0.01),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.06,
                          ),
                          Text(
                            'Hi Sir,',
                            style: GoogleFonts.poppins(
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Continue your journey with us,',
                            style: GoogleFonts.poppins(
                              fontSize: h * 0.016,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: -25,
                  height: 230,
                  width: 180,
                  child: Image.asset('assets/7.png'),
                ),
// Text Box
              ],
            ),
            SizedBox(
              height: h * 0.018,
            ),
            overView(
                t1: "Today Attendence",
                t2: "Total strength : 5550",
                t3: "Present : 3500",
                t4: "Absent : 2050",
                t5: "Present : 60%",
                t6: "Absent : 40%",
                cl: const Color(0xFF0494FD)),
            SizedBox(
              height: h * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.0149,
                ),
                first(
                    t1: "Fee overview : ",
                    t2: "Amount Received : 5500",
                    t3: "Payers : 3",
                    cl1: secondaryColor,
                    cl: primaryColor,
                    s1: h * 0.0165,
                    onpressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeeDetails()));
                    }),
                first(
                    t1: "Accounts Overview :",
                    t2: "Income : 65000",
                    t3: "Expense : 25000",
                    cl1: secondaryColor,
                    cl: primaryColor,
                    s1: h * 0.017,
                    onpressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Accounts()));
                    })
              ],
            ),
            SizedBox(
              height: h * 0.005,
            ),
            second(
                t1: "Circular :",
                t2: "Annual day celebration at 25th at this month.",
                cl1: secondaryColor,
                s1: h * 0.019,
                cl: primaryColor,
                onpressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Announcement()));
                })
          ],
        ),
      ),
    );
  }

  ListTile list({Icon? icon, String? text1, double? size, Color? clr}) {
    return ListTile(
      leading: icon,
      title: Text(
        text1!,
        style: GoogleFonts.poppins(
          fontSize: size,
        ),
      ),
      onTap: () {},
      tileColor: clr,
    );
  }

  Card first(
      {required String t1,
      required String t2,
      required String t3,
      required Color cl,
      required Color cl1,
      required double s1,
      void Function()? onpressed}) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      elevation: 10,
      child: Container(
        width: w * 0.465,
        height: h * 0.18,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFFFF6060),
            Color(0xFF489AFE),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(h * 0.01),
        ),
        padding: EdgeInsets.all(w * 0.01), // Padding for the inner container
        child: Container(
            decoration: BoxDecoration(
              color: cl1, // Inner background color
              borderRadius: BorderRadius.circular(h * 0.01),
            ),
            child: Padding(
                padding: const EdgeInsets.all(9),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.stars),
                        Text(
                          t1,
                          style: GoogleFonts.poppins(
                              fontSize: h * 0.0165,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          t2,
                          style: GoogleFonts.poppins(fontSize: s1),
                        ),
                        Text(
                          t3,
                          style: GoogleFonts.poppins(fontSize: s1),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: w * 0.015,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: onpressed,
                            icon: Icon(
                              Icons.arrow_circle_right,
                              size: h * 0.041,
                              color: cl,
                            )),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }

  Card second(
      {required String t1,
      required String t2,
      required Color cl,
      required Color cl1,
      required double s1,
      void Function()? onpressed}) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      elevation: 10,
      child: Container(
        width: w * 0.95,
        height: h * 0.2,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFFFF6060),
            Color(0xFF489AFE),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(h * 0.01),
        ),
        padding: EdgeInsets.all(w * 0.01), // Padding for the inner container
        child: Container(
            decoration: BoxDecoration(
              color: cl1, // Inner background color
              borderRadius: BorderRadius.circular(h * 0.01),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(9, 9, 9, 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.stars),
                        Text(
                          t1,
                          style: GoogleFonts.poppins(
                              fontSize: h * 0.019, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.1,
                        ),
                        SizedBox(
                          height: h * 0.07,
                          width: w * 0.7,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  t2,
                                  style: GoogleFonts.poppins(fontSize: s1),
                                ),
                                Text(
                                  t2,
                                  style: GoogleFonts.poppins(fontSize: s1),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: onpressed,
                            icon: Icon(
                              Icons.arrow_circle_right,
                              size: h * 0.041,
                              color: cl,
                            ))
                      ],
                    )
                  ],
                ))),
      ),
    );
  }

  Card overView(
      {required String t1,
      required String t2,
      required String t3,
      required String t4,
      required String t5,
      required String t6,
      required Color cl}) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      elevation: 10,
      child: Container(
        width: w * 0.95,
        height: h * 0.25,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFFFF6060),
            Color(0xFF489AFE),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(h * 0.01),
        ),
        padding: EdgeInsets.all(w * 0.01), // Padding for the inner container
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white, // Inner background color
            borderRadius: BorderRadius.circular(h * 0.01),
          ),
          child: Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.stars),
                      Text(
                        t1,
                        style: GoogleFonts.poppins(
                            fontSize: h * 0.019, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.018,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: h * 0.16,
                            width: w * 0.3,
                            child: SfCircularChart(
                              series: <CircularSeries>[
                                DoughnutSeries<AttendencedataType, String>(
                                  dataSource: attendenceData,
                                  xValueMapper: (AttendencedataType data, _) =>
                                      data.status,
                                  yValueMapper: (AttendencedataType data, _) =>
                                      data.value,
                                  pointColorMapper:
                                      (AttendencedataType data, _) => data.color,
                                  innerRadius: '60%',
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: false),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: w * 0.03,
                      ),
                      Column(
                        children: [
                          Text(
                            t2,
                            style: GoogleFonts.poppins(fontSize: h * 0.019),
                          ),
                          Text(
                            t3,
                            style: GoogleFonts.poppins(fontSize: h * 0.019),
                          ),
                          Text(
                            t4,
                            style: GoogleFonts.poppins(fontSize: h * 0.019),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.02,
                                    width: w * 0.035,
                                    decoration: BoxDecoration(color: cl),
                                  ),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  Text(
                                    t5,
                                    style: GoogleFonts.poppins(
                                        fontSize: h * 0.019),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: h * 0.015,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: h * 0.02,
                                    width: w * 0.035,
                                    decoration:
                                        const BoxDecoration(color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: w * 0.01,
                                  ),
                                  Text(
                                    t6,
                                    style: GoogleFonts.poppins(
                                        fontSize: h * 0.019),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        width: w * 0.015,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Attendence()));
                              },
                              icon: Icon(
                                Icons.arrow_circle_right,
                                size: h * 0.0455,
                                color: cl,
                              )),
                        ],
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Card crd({Color? clr, String? txt}) {
    return Card(
      elevation: 4,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      color: clr,
      child: SizedBox(
        height: h * 0.05,
        width: w * 0.3,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.01,
            ),
            Text(
              txt!,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: h * 0.025, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class AttendencedataType {
  final String status;
  final double value;
  final Color color;

  AttendencedataType(this.status, this.value, this.color);
}
