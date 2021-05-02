import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundcolor;
  final Color fontColor;
  final Color borderColor;
  final Color overlayColor;
  final VoidCallback onTap;

  NextButtonWidget({
    required this.label, 
    required this.backgroundcolor, 
    required this.fontColor,
    required this.borderColor,
    required this.overlayColor,
    required this.onTap
    });

  NextButtonWidget.green({required String label, required VoidCallback onTap})
  : 
  this.backgroundcolor = AppColors.darkGreen, 
  this.fontColor = AppColors.white,
  this.borderColor = AppColors.green, 
  this.overlayColor = Colors.green,
  this.onTap = onTap,
  this.label = label;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
  : 
  this.backgroundcolor = AppColors.purple, 
  this.fontColor = AppColors.white,
  this.borderColor = AppColors.purple, 
  this.overlayColor = Colors.deepPurple,
  this.onTap = onTap,
  this.label = label;

  NextButtonWidget.transparent({required String label, required VoidCallback onTap})
  : 
  this.backgroundcolor = Colors.transparent, 
  this.fontColor = AppColors.grey,
  this.borderColor = Colors.transparent, 
  this.overlayColor = AppColors.border,
  this.onTap = onTap,
  this.label = label;


  NextButtonWidget.white({required String label, required VoidCallback onTap})
  : 
  this.backgroundcolor = AppColors.white, 
  this.fontColor = AppColors.lightGrey,
  this.borderColor = AppColors.border, 
  this.overlayColor = AppColors.border,
  this.onTap = onTap,
  this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundcolor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )),
          side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          overlayColor: MaterialStateProperty.all(overlayColor)
          ),
        onPressed: onTap,
        child: Text(label, style: GoogleFonts.notoSans(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: fontColor
        ),),
      ),
    );
  }
}