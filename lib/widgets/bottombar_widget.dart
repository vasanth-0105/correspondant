import 'package:correspondant_application/comman_color/common_colors.dart';
import 'package:correspondant_application/screens/Announcement_screen.dart';
import 'package:correspondant_application/screens/accounts_screen.dart';
import 'package:correspondant_application/screens/fee_screen.dart';
import 'package:correspondant_application/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var index = 0;
  List Screen = [const HomeScreen(), const FeeDetails(), const Accounts(), const Announcement()];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Screen[i],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        onTap: (index) {
          setState(() {
            i = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_rupee), label: "Fee"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_sharp), label: "Accounts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.announcement), label: "Circulars")
        ],
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins(),
      ),
    );
  }
}
