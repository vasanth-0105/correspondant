import 'package:correspondant_application/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import '../comman_color/common_colors.dart';

PreferredSizeWidget appBarWidget({
  required String title,
  double? fontsize,
  Color ? color,
}) =>
    AppBar(
      backgroundColor: primaryColor,
      centerTitle: true,
      title: textwidget(
        text: title,
        wt: FontWeight.w700,
        color: color,
      ),
    );
