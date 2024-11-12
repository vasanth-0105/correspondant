import 'package:correspondant_application/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../comman_color/common_colors.dart';
import '../widgets/appbar_widget.dart';

class announcement extends StatefulWidget {
  const announcement({super.key});

  @override
  State<announcement> createState() => _announcementState();
}

class _announcementState extends State<announcement> {
  var h, w;
  bool isStudentChecked = false;
  bool isStaffChecked = false;
  bool isBothChecked = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(
        title: "Announcements",
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
              children: [
                crd1(
                    clr: primaryColor,
                    txt: "Details :",
                    sizew: w * 0.3,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w * 0.5,
                  child: Image.asset('assets/3.png'),
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
                    text: "Today's Announcements :",
                    s1: h * 0.02,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.13,
                ),
                second(
                  t1: "Circular :",
                  t2: "Annual day celebration at 25th at this month.",
                  cl1: secondaryColor,
                  s1: h * 0.019,
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
                    text: "Create Announcement :",
                    s1: h * 0.02,
                    wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            cntr1(txt1: "Title :"),
            SizedBox(
              height: h * 0.01,
            ),
            cntr2(),
            SizedBox(
              height: h * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.08,
                ),
                textwidget(
                    text: "Announcement :", s1: h * 0.02, wt: FontWeight.w700)
              ],
            ),
            SizedBox(
              height: h * 0.005,
            ),
            cntr3(),
            SizedBox(
              height: h * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                crd1(
                    clr: primaryColor,
                    txt: "Publish",
                    sizew: w * 0.25,
                    wt: FontWeight.w500),
                crd1(
                    clr: color4,
                    txt: "Save Draft",
                    sizew: w * 0.33,
                    wt: FontWeight.w500),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container cntr1({
    required String txt1,
  }) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: w * 0.2,
              ),
              textwidget(text: txt1, s1: h * 0.02, wt: FontWeight.w700),
              SizedBox(
                width: w * 0.01,
              ),
              Container(
                width: w * 0.6,
                child: TextField(
                  decoration: InputDecoration(
                      isDense: true,
                      labelText: "Title",
                      labelStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(h * 0.01),
                      )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container cntr2({Color? clr}) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: w * 0.08,
          ),
          textwidget(text: "Category :", s1: h * 0.02, wt: FontWeight.w700),
          Checkbox(
            value: isStudentChecked,
            onChanged: (bool? value) {
              setState(() {
                isStudentChecked = value!;
              });
            },
          ),
          textwidget(text: "Student", s1: h * 0.0185),
          Checkbox(
            value: isStaffChecked,
            onChanged: (bool? value) {
              setState(() {
                isStaffChecked = value!;
              });
            },
          ),
          textwidget(text: "Staff", s1: h * 0.0185),
          Checkbox(
            value: isBothChecked,
            onChanged: (bool? value) {
              setState(() {
                isBothChecked = value!;
              });
            },
          ),
          textwidget(text: "Both", s1: h * 0.0185),
        ],
      ),
    );
  }

  Container cntr3({Color? clr}) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: w * 0.2,
          ),
          Container(
            width: w * 0.75,
            child: TextField(
              maxLines: 2,
              decoration: InputDecoration(
                  isDense: true,
                  hintText: "Type Here....",
                  hintStyle: GoogleFonts.poppins(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(h * 0.01),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Card crd1(
      {Color? clr, String? txt, double? sizew, FontWeight? wt, Color? clr1}) {
    return Card(
      elevation: 4,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      color: clr,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: h * 0.05,
          width: sizew,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 0.01,
              ),
              Text(
                txt!,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: h * 0.025, fontWeight: wt),
              ),
            ],
          ),
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

  Card second({
    String? t1,
    String? t2,
    Color? cl1,
    double? s1,
  }) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(h * 0.01)),
      elevation: 10,
      child: Container(
        width: w * 0.83,
        height: h * 0.145,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xFF58FF3E),
            Color(0xFF3590FF),
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
                padding: EdgeInsets.fromLTRB(9, 9, 9, 2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.stars),
                        Text(
                          t1!,
                          style: GoogleFonts.poppins(
                              fontSize: h * 0.019, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.07,
                        ),
                        Container(
                          height: h * 0.07,
                          width: w * 0.69,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Text(
                                  t2!,
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
                  ],
                ))),
      ),
    );
  }
}
