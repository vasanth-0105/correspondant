import 'package:correspondant_application/comman_color/common_colors.dart';
import 'package:correspondant_application/widgets/appbar_widget.dart';
import 'package:correspondant_application/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class attendence extends StatefulWidget {
  const attendence({super.key});

  @override
  State<attendence> createState() => _attendenceState();
}

class _attendenceState extends State<attendence> {
  var h, w;
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? customDate;
  String? selectedValue;
  String? selectedValue1;
  String? selectedValue2;
  final List<String> items = ['Select', 'School','Teachers', 'Class', 'Section', 'Student',];
  final List<String> classItems = ['Select', 'I', 'II', 'III', 'IV','V','VI','VII','VIII','IX','X'];
  final List<String> secItems = ['Select','A', 'B','C','D'];
  bool isTodayChecked = false;
  bool isYesterdayChecked = false;

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


  Future<void> selectDate1(BuildContext context, bool) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: customDate ?? DateTime.now(), // initial date
      firstDate: DateTime(2000), // minimum date
      lastDate: DateTime(2101),  // maximum date
    );
    if (picked != null && picked != customDate) {
      setState(() {
        customDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarWidget(title: "Attendence Details", color: secondaryColor,),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(height: h*0.045,
                decoration: BoxDecoration(
                    color: primaryColor
                ),),
              list(text1: "Menu",size: h*0.03,clr: primaryColor),
              list(icon: Icon(Icons.home),text1: "Home",onprs: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }),
              list(icon: Icon(Icons.settings),text1: "Settings"),
              Spacer(),
              list(icon: Icon(Icons.logout),text1: "Logout"),
              SizedBox(height: h*0.01,)
            ],
          ),
        ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
        children: [
          SizedBox(height: h*0.03,),
          Row(
            children: [
              crd1(clr: primaryColor,txt: "Report :",sizew: w*0.3,wt: FontWeight.bold)
            ],
          ),
          SizedBox(height: h*0.05,),
          second(),
          SizedBox(height: h*0.05,),
          column(clr1: primaryColor)
        ],
      ),),
    );
  }

  Column column({
    Color ? clr1
})
{
  return Column(
    children: [
      Padding(padding: EdgeInsets.all(h*0.0135),
      child: Container(
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FlexColumnWidth(0.7),
          1: FlexColumnWidth(1.8),
          2: FlexColumnWidth(2.3),
          3: FlexColumnWidth(1.7),
        },
children: [
  tableRow(t1: "S.No", t2: "Name", t3: "Class & Section", t4: "Date", t5: "Status",fontweight: FontWeight.bold),
  tableRow(t1: "1", t2: "John Doe", t3: "VII-C", t4: "22/10/2024", t5: "Present"),
  tableRow(t1: "2", t2: "Jane Smith", t3: "X-A", t4: "22/10/2024", t5: "Absent"),
  tableRow(t1: "3", t2: "Jimmy", t3: "V-B", t4: "22/10/2024", t5: "Absent"),
  tableRow(t1: "4", t2: "Hari", t3: "X-C", t4: "22/10/2024", t5: "Present")
],
),),)
  ]
  );
}

TableRow tableRow ({
    required String t1,
  required String t2,
  required String t3,
  required String t4,
  required String t5,
  FontWeight ? fontweight

})
{
  return TableRow(
  children: [
    TableCell(child: Center(child: Text(t1,style: GoogleFonts.poppins(fontWeight: fontweight),),)),
TableCell(child: Center(child: Text(t2,style: GoogleFonts.poppins(fontWeight: fontweight),),)),
TableCell(child: Center(child: Text(t3,style: GoogleFonts.poppins(fontWeight: fontweight),),)),
TableCell(child: Center(child: Text(t4,style: GoogleFonts.poppins(fontWeight: fontweight),),)),
TableCell(child: Center(child: Text(t5,style: GoogleFonts.poppins(fontWeight: fontweight),),)),

  ]
  );
}



  ListTile list({
    Icon ? icon,
    String ? text1,
    double ? size,
    Color ? clr,
    void Function() ? onprs
  })
  {
    return ListTile(
      leading: icon,
      title: Text(text1!, style: GoogleFonts.poppins(
        fontSize: size,
      ),),
      onTap: onprs,
      tileColor: clr,
    );
  }

  Card crd({
    Color ? clr,
    String ? txt,
    double ? sizew,
    FontWeight ? wt,
    IconData ? icon,
    Color ? clr1
})
{
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.01)),
  color: clr,
  child: InkWell(
    onTap: () {},
    child: Container(
  height: h*0.05,
  width: sizew,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
  children: [
  SizedBox(height: h*0.01,),
  Text(txt!,textAlign: TextAlign.center,style: GoogleFonts.poppins(
  fontSize: h*0.025,
  fontWeight: wt
  ),),
    SizedBox(width: w*0.019,),
    Icon(icon ,color: clr1,),
  ],
  ),
  ),),
  );
}

Card crd1({
  Color ? clr,
  String ? txt,
  double ? sizew,
  FontWeight ? wt,
  Color ? clr1
})
{
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.01)),
  color: clr,
  child: InkWell(
  onTap: () {},
  child: Container(
  height: h*0.05,
  width: sizew,
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  SizedBox(height: h*0.01,),
  Text(txt!,textAlign: TextAlign.center,style: GoogleFonts.poppins(
fontSize: h*0.025,
fontWeight: wt
),),
],
),
),),
  );
}

Card second({
    Color ? clr
})
{
  return Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.01)),
  elevation: 10,
  child: Container(
  width: w*0.95,
  height: h*0.45,
  decoration: BoxDecoration(
  gradient: const LinearGradient(
  colors: [
  Color(0xFFFF6060),
  Color(0xFF489AFE),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight
  ),
  borderRadius: BorderRadius.circular(h*0.01),
  ),
  padding: EdgeInsets.all(w * 0.01), // Padding for the inner container
child: Container(
decoration: BoxDecoration(
color: Colors.white, // Inner background color
borderRadius: BorderRadius.circular(h*0.01),
),child: Padding(padding: EdgeInsets.all(h*0.02),
child: Column(
  children: [
    Row(
      children: [
        Column(
          children: [
            Text("Report For :",style: GoogleFonts.poppins(
              fontSize: h*0.02,
            ),)
          ],
        ),
        SizedBox(width: w*0.019,),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor,width: 1.5),
                  borderRadius: BorderRadius.circular(h*0.01),
              ),
              height: h*0.05,
              width: w*0.27,
              child: DropdownButton<String>(
                value: selectedValue ?? items[0],
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(value),
                    ),
                  );
                }).toList(),
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                icon: Icon(Icons.arrow_drop_down),
                underline: Container(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ],
    ),
    SizedBox(height: h*0.02,),
    Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text("Class :",style: GoogleFonts.poppins(
                  fontSize: h*0.02,
                ),),
                SizedBox(width: w*0.019,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1.5),
                      borderRadius: BorderRadius.circular(h*0.01),
                  ),
                  height: h*0.05,
                  width: w*0.23,
                  child: DropdownButton<String>(
                    value: selectedValue1 ?? classItems[0],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue1 = newValue;
                      });
                    },
                    items: classItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),Spacer(),
        Column(
          children: [
            Row(
              children: [
                Text("Section :",style: GoogleFonts.poppins(
                  fontSize: h*0.02,
                ),),
                SizedBox(width: w*0.019,),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor,width: 1.5),
                      borderRadius: BorderRadius.circular(h*0.01),
                  ),
                  height: h*0.05,
                  width: w*0.22,
                  child: DropdownButton<String>(
                    value: selectedValue2 ?? secItems[0],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue2 = newValue;
                      });
                    },
                    items: secItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                    style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    icon: Icon(Icons.arrow_drop_down),
                    underline: Container(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),

      ],
    ),
    SizedBox(height: h*0.02,),
    Row(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isTodayChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isTodayChecked = value!;
                    });
                  },
                ),
                textwidget(text: "Today",s1: h*0.0185), // Text after the checkbox
              ],
            ),
          ],
        ),Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isYesterdayChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isYesterdayChecked = value!;
                    });
                  },
                ),
                textwidget(text: "Yesterday",s1: h*0.0185), // Text after the checkbox
              ],
            ),
          ],
        ),
      ],
    ),SizedBox(height: h*0.01,),
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: w*0.038,),
        Text("Custom :", style: GoogleFonts.poppins(fontSize: h * 0.02)),
        SizedBox(width: w*0.019,),
        GestureDetector(
          onTap: () => selectDate1(context, true),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              customDate != null ? "${customDate!.day}/${customDate!.month}/${customDate!.year}" : "dd/mm/yyyy",
              style: GoogleFonts.poppins(fontSize: h * 0.018),
            ),
          ),
        ),
      ],
    ),
    SizedBox(height: h*0.02,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // From Date Picker
        Row(
          children: [
            Text("From :", style: GoogleFonts.poppins(fontSize: h * 0.02)),
            SizedBox(width: w*0.019,),
            GestureDetector(
              onTap: () => selectDate(context, true),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  fromDate != null ? "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}" : "dd/mm/yyyy",
                  style: GoogleFonts.poppins(fontSize: h * 0.018),
                ),
              ),
            ),
          ],
        ),
        // To Date Picker
        Row(
          children: [
            Text("To:", style: GoogleFonts.poppins(fontSize: h * 0.02)),
            SizedBox(width: w*0.019,),
            GestureDetector(
              onTap: () => selectDate(context, false),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  toDate != null ? "${toDate!.day}/${toDate!.month}/${toDate!.year}" : "dd/mm/yyyy",
                  style: GoogleFonts.poppins(fontSize: h * 0.018),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    SizedBox(height: h*0.02,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        crd1(clr: primaryColor,txt: "Get Attendence",sizew: w*0.5,wt: FontWeight.w500),
        crd(clr: color4,txt: "Report",sizew: w*0.3,wt: FontWeight.w500,icon: Icons.file_copy_rounded,clr1: borderColor)
      ],
    )
  ],
),
),),)
  );
}
}