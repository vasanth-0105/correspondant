import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../comman_color/common_colors.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/textwidget.dart';

class accounts extends StatefulWidget {
  const accounts({super.key});

  @override
  State<accounts> createState() => _accountsState();
}

class _accountsState extends State<accounts> {
  var h, w;
  DateTime? fromDate;
  DateTime? toDate;
  final List<ChartData> data = [
    ChartData('Jun', 4734),
    ChartData('Jul', 5448),
    ChartData('Aug', 9489),
    ChartData('Sep', 1270),
    ChartData('Oct', 3620),
    ChartData('Nov', 6768),
    ChartData('Dec', 6095),
    ChartData('Jan', 7722),
    ChartData('Feb', 3371),
    ChartData('Mar', 3971),
    ChartData('Apr', 2595)
  ];

  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBarWidget(
        title: "Accounts",
        color: secondaryColor,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: h * 0.045,
              decoration: const BoxDecoration(color: primaryColor),
            ),
            list(text1: "Menu", size: h * 0.03, clr: primaryColor),
            list(
                icon: const Icon(Icons.home),
                text1: "Home",
                onprs: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
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
              children: [crd(clr: primaryColor, txt: "Details :")],
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w * 0.65,
                  child: Image.asset('assets/4.png'),
                )
              ],
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textwidget(
                    text: "Today's Overview :",
                    s1: h * 0.028,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                crd1(
                    text1: "Income",
                    text2: "Rs.55,000",
                    imagePath: "assets/5.png"),
                crd1(
                    text1: "Expense",
                    text2: "Rs.30,000",
                    imagePath: "assets/6.png")
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [crd2()],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textwidget(
                    text: "This Academic Year Analysis :",
                    s1: h * 0.0265,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                cntr2(t1: "Expenses"),
                SizedBox(
                  width: w * 0.05,
                )
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [sb()],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [crd3()],
            ),
            SizedBox(
              height: h * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.03,
                ),
                textwidget(
                    text: "For a Particular Date or Year :",
                    s1: h * 0.0255,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [cntr3()],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                crd4(txt: "Get Report", clr: primaryColor, wt: FontWeight.w600)
              ],
            ),
            SizedBox(
              height: h * 0.04,
            ),
          ],
        ),
      ),
    );
  }

  ListTile list(
      {Icon? icon,
      String? text1,
      double? size,
      Color? clr,
      void Function()? onprs}) {
    return ListTile(
      leading: icon,
      title: Text(
        text1!,
        style: GoogleFonts.poppins(
          fontSize: size,
        ),
      ),
      onTap: onprs,
      tileColor: clr,
    );
  }

  Card crd({Color? clr, String? txt}) {
    return Card(
      elevation: 4,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      color: clr,
      child: Container(
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

  Card crd1(
      {Color? clr, String? text1, String? text2, required String imagePath}) {
    return Card(
      elevation: 4,
      child: Container(
        height: h * 0.12,
        width: w * 0.45,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: h * 0.002),
            borderRadius: BorderRadius.circular(h * 0.01)),
        child: Column(
          children: [
            Container(
              height: h * 0.06,
              width: w * 0.5,
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor, width: h * 0.002),
                  borderRadius: BorderRadius.circular(h * 0.01),
                  color: primaryColor),
              child: Padding(
                padding: EdgeInsets.all(h * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(imagePath),
                      width: w * 0.12,
                    ),
                    textwidget(text: text1!, s1: h * 0.025, wt: FontWeight.w700)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.013,
            ),
            textwidget(text: text2!, s1: h * 0.025, wt: FontWeight.w600)
          ],
        ),
      ),
    );
  }

  Card crd2({Color? clr2}) {
    return Card(
      elevation: 4,
      child: Container(
        height: h * 0.37,
        width: w * 0.92,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: h * 0.002),
            borderRadius: BorderRadius.circular(h * 0.01)),
        child: Column(
          children: [
            Container(
              height: h * 0.09,
              width: w * 0.92,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: h * 0.002),
                borderRadius: BorderRadius.circular(h * 0.01),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset("assets/8.png"),
                    width: w * 0.14,
                  ),
                  textwidget(
                      text: "Latest Insights",
                      s1: h * 0.03,
                      wt: FontWeight.w700)
                ],
              ),
            ),
            SizedBox(
              height: h * 0.013,
            ),
            Container(
              height: h * 0.189,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    cntr(
                        image2: "assets/2.png",
                        txt1: "HariBaskar",
                        txt2: "Salary",
                        txt3: "₹ 15,000",
                        clr3: w1),
                    cntr(
                        image2: "assets/2.png",
                        txt1: "Vasanth",
                        txt2: "Fee",
                        txt3: "₹ 35,000",
                        clr3: r1),
                    cntr(
                        image2: "assets/2.png",
                        txt1: "Praveen",
                        txt2: "Bus Service",
                        txt3: "₹ 5,000",
                        clr3: w1),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.018,
            ),
            Column(
              children: [
                textwidget(
                    text: "Click here to see full details ",
                    s1: h * 0.027,
                    wt: FontWeight.w600,
                    color: primaryColor)
              ],
            )
          ],
        ),
      ),
    );
  }

  Card crd3({Color? clr}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(h * 0.02),
      ),
      elevation: 4,
      child: Container(
        height: h * 0.13,
        width: w * 0.9,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(h * 0.02)),
        child: Padding(
          padding: EdgeInsets.all(h * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildFinancialItem(
                icon: Icons.attach_money,
                iconColor: Colors.green,
                label: 'Income',
                amount: '\₹ 110000',
              ),
              buildDivider(),
              buildFinancialItem(
                icon: Icons.account_balance_wallet,
                iconColor: Colors.orange,
                label: 'Expenses',
                amount: '\₹ 40000',
              ),
              buildDivider(),
              buildFinancialItem(
                icon: Icons.money_off,
                iconColor: Colors.red,
                label: 'Unpaid',
                amount: '\₹ 50000',
              ),
              buildDivider(),
              buildFinancialItem(
                icon: Icons.currency_rupee,
                iconColor: Colors.blue,
                label: 'Balance',
                amount: '\₹ 20000',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card crd4({
    Color? clr,
    String? txt,
    double? sizew,
    FontWeight? wt,
  }) {
    return Card(
      elevation: 4,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      color: clr,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: h * 0.055,
          child: Padding(
            padding: EdgeInsets.all(h * 0.012),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  txt!,
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(fontSize: h * 0.025, fontWeight: wt),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container cntr3({Color? color2}) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // From Date Picker
          Row(
            children: [
              Text("From :", style: GoogleFonts.poppins(fontSize: h * 0.02)),
              SizedBox(
                width: w * 0.019,
              ),
              GestureDetector(
                onTap: () => selectDate(context, true),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    fromDate != null
                        ? "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}"
                        : "dd/mm/yyyy",
                    style: GoogleFonts.poppins(fontSize: h * 0.018),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: w * 0.02,
          ),
          Row(
            children: [
              Text("To:", style: GoogleFonts.poppins(fontSize: h * 0.02)),
              SizedBox(
                width: w * 0.019,
              ),
              GestureDetector(
                onTap: () => selectDate(context, false),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Text(
                    toDate != null
                        ? "${toDate!.day}/${toDate!.month}/${toDate!.year}"
                        : "dd/mm/yyyy",
                    style: GoogleFonts.poppins(fontSize: h * 0.018),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container cntr2({
    required String t1,
  }) {
    return Container(
      child: Row(
        children: [
          Container(
            height: h * 0.02,
            width: w * 0.035,
            decoration: const BoxDecoration(color: primaryColor),
          ),
          SizedBox(
            width: w * 0.01,
          ),
          Text(
            t1,
            style: GoogleFonts.poppins(fontSize: h * 0.019),
          )
        ],
      ),
    );
  }

  Container cntr(
      {Color? clr3, String? txt1, String? txt2, String? txt3, String? image2}) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(h * 0.01),
        child: Row(
          children: [
            SizedBox(
              width: w * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image2!),
                  radius: h * 0.035,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textwidget(text: txt1!, s1: h * 0.025),
                textwidget(text: txt2!, s1: h * 0.02)
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [textwidget(text: txt3!, s1: h * 0.02, color: clr3)],
            ),
            SizedBox(
              width: w * 0.02,
            )
          ],
        ),
      ),
    );
  }

  SizedBox sb({Color? color}) {
    return SizedBox(
      height: h * 0.35,
      width: w * 0.95,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <CartesianSeries>[
          ColumnSeries<ChartData, String>(
            dataSource: data,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            color: primaryColor,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  Widget buildFinancialItem({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String amount,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: iconColor, size: h * 0.033),
        SizedBox(height: h * 0.007),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: h * 0.017,
            fontWeight: FontWeight.w600,
            color: Colors.grey[500],
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.poppins(
            fontSize: h * 0.018,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildDivider() {
    return Container(
      height: h * 0.1,
      width: 1.5,
      color: Colors.black87,
    );
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}
