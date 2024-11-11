import 'package:correspondant_application/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../comman_color/common_colors.dart';
import '../widgets/appbar_widget.dart';

class feeDetails extends StatefulWidget {
  const feeDetails({super.key});

  @override
  State<feeDetails> createState() => _feeDetailsState();
}

class  _feeDetailsState extends State<feeDetails> {
  var h,w;
  String? selectedValue;
  final List<String> Items = ['Select','Paid','Partially Paid','Overdue'];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: appBarWidget(title: "Fee Details", color: secondaryColor,),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(height: h*0.045,
                decoration: const BoxDecoration(
                    color: primaryColor
                ),),
              list(text1: "Menu",size: h*0.03,clr: primaryColor),
              list(icon: const Icon(Icons.home),text1: "Home",onprs: (){
                Navigator.pop(context);
                Navigator.pop(context);
              }),
              list(icon: const Icon(Icons.settings),text1: "Settings"),
              const Spacer(),
              list(icon: const  Icon(Icons.logout),text1: "Logout"),
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
                crd1(clr: primaryColor,txt: "Details :",sizew: w*0.3,wt: FontWeight.w700)
              ],
            ),
            SizedBox(height: h*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: w*0.62,
                  child: Image.asset('assets/1.png'),
                )
              ],
            ),
            SizedBox(height: h*0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cntr1()
              ],
            ),
            SizedBox(height: h*0.03,),
            card1(text1: "Jane Smith",text2: "Paid", text3: "Rs.13,000",size1: h*0.022,fonttwt1: FontWeight.w500),
            SizedBox(height: h*0.005,),
            card1(text1: "jane Smith",text2: "Paid", text3: "Rs.13,000",size1: h*0.022,fonttwt1: FontWeight.w500),
            SizedBox(height: h*0.005,),
            card1(text1: "jane Smith",text2: "Paid", text3: "Rs.13,000",size1: h*0.022,fonttwt1: FontWeight.w500)
          ],
        ),
      ),
    );
  }

  Container cntr1({
    Color ? color1
})
  {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor,width: 1.5),
        borderRadius: BorderRadius.circular(h*0.01),
      ),
      height: h*0.05,
      width: w*0.9,
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedValue ?? Items[0],
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
          });
        },
        items: Items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
        style: GoogleFonts.poppins(color: Colors.black, fontSize: h*0.018),
        icon: Icon(Icons.arrow_drop_down),
        alignment: Alignment.center,
        underline: Container(
          color: Colors.black,
        ),
      ),
    );
  }



  Card card1({
    Color ? clr,
    String ? text1,
    String ? text2,
    String ? text3,
    String ? text4,
    double ? size1,
    FontWeight ? fonttwt1,
})
{
  return Card(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(h*0.02)),
  elevation: 10,
  child: Container(
  width: w*0.96,
  height: h*0.11,
  decoration: BoxDecoration(
  gradient: const LinearGradient(
  colors: [
  Color(0xFF58FF3E),
  Color(0xFF3590FF),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight
  ),
  borderRadius: BorderRadius.circular(h*0.02),
  ),
  padding: EdgeInsets.all(w * 0.01), // Padding for the inner container
child: Container(
decoration: BoxDecoration(
color: Colors.white, // Inner background color
borderRadius: BorderRadius.circular(h*0.02),
),
child: Padding(padding: EdgeInsets.fromLTRB(h*0.015, 0.015, 0.015, 0),
child: Row(
children: [
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage("assets/2.png"),
        radius: h*0.032,
        backgroundColor: Colors.transparent,
      ),
    ],
  ),
  SizedBox(width: w*0.027,),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        children: [
          textwidget(text: text1!,s1: size1,wt: fonttwt1),
        ],
      ),
      Row(
        children: [
          Text("VII-A",style: GoogleFonts.poppins(),),
        ],
      )
    ],
  ),
  SizedBox(width: w*0.027,),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      textwidget(text: text2!, s1: size1, wt: fonttwt1)
    ],
  ),
  SizedBox(width: w*0.027,),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      textwidget(text: text3! ,s1: size1,wt: fonttwt1)
    ],
  ),
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(onPressed: () {
        showDialog(context: context,
            builder: (context)=>ad1(txt1: "Jane Smith",txt2: "VII-C",txt3: "Partially Paid",txt4: "Rs.35000",txt5: "Rs.20000",txt6: "Rs.15000")
        );
      }, icon: Icon(Icons.arrow_circle_right,size: h*0.041,color: primaryColor,))
    ],
  )
   ],
    ),),),)
);
}


AlertDialog ad1({
    required String  txt1,
    required String  txt2,
  required String  txt3,
  required String  txt4,
  required String  txt5,
  required String  txt6,
  })
{
  return AlertDialog(
  title: Text("Fee Details",style: GoogleFonts.poppins(
  fontWeight: FontWeight.bold,
  ),),
  content: Row(
    children: [
      Container(
        height: h*0.3,
        width: w*0.67,
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Name : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt1,s1: h*0.02)
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Class & Section : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt2,s1: h*0.02)
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Status : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt3,s1: h*0.02)
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Total Amount : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt4,s1: h*0.02)
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Amount Paid : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt5,s1: h*0.02)
          ],
        ),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textwidget(text: "Amount Balance : ",s1: h*0.02,wt: FontWeight.w700),
            textwidget(text: txt6,s1: h*0.02)
          ],
        ),
        ],)
    )],
  ),
  actions: [
  TextButton(onPressed: () {
  Navigator.of(context).pop();
  },
  child: textwidget(text: "Ok",s1: h*0.02,wt: FontWeight.w800))
  ]
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
}
