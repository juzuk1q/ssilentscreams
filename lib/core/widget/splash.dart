import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatelessWidget {
  final String img;
  final String mainText;
  final String description;

  const OnboardingWidget({super.key, 
    required this.img,
    required this.mainText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 475,
      child: Column(
        children: [
          SizedBox(height: 350, child: Image.asset(img),),
          SizedBox(width: 297, child: Text(mainText, style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryColor), textAlign: TextAlign.center,)),
          SizedBox(height: 10,),
          SizedBox(width: 280, child: Text(description, style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor1),textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
