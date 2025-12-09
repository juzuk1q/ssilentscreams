import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/presentation/screen/home/home.dart';

class deliverySuccess extends StatefulWidget {
  const deliverySuccess({super.key});

  @override
  State<deliverySuccess> createState() => _deliverySuccessState();
}

class _deliverySuccessState extends State<deliverySuccess>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool show = false;
  int star = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    )..repeat();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        show = true;
        _controller.stop();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                show
                    ? Image.asset(
                        'assets/images/success.png',
                        height: 150,
                        width: 150,
                      )
                    : RotationTransition(
                        turns: Tween(
                          begin: 0.0,
                          end: -1.0,
                        ).animate(_controller),
                        child: Image.asset(
                          'assets/images/load1.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                SizedBox(height: 75),
                show
                    ? Text(
                        'Delivery Successful',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        'Delivery Successful',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                SizedBox(height: 8),
                show
                    ? Text(
                        'Your Item has been delivered successfully',
                        style: GoogleFonts.roboto(fontSize: 14),
                      )
                    : Text(
                        'Your Item has been delivered successfully',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      'Rate rider',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Row(mainAxisAlignment: .center,
                      children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < star ? Icons.star : Icons.star_border,
                          color: AppColors.primaryColor,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            star = index + 1;
                          });
                        },
                      );
                    }),),
                  ],
                ), // rate rider (useless thing, imho)
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.textColor1.withAlpha(21),
                        offset: Offset(-3, 5),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        color: AppColors.textColor1.withAlpha(7),
                        offset: Offset(1, -2.3),
                        blurRadius: 3,
                      ),
                      BoxShadow(color: AppColors.white, offset: Offset(-2.4, -2))
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/feedback.png', width: 30,),
                      SizedBox(width: 6,),
                      Expanded(
                        child: TextField(
                          maxLines: 1,
                          style: GoogleFonts.roboto(fontSize: 14, color: AppColors.textColor1),
                          decoration: InputDecoration(
                            isDense: true,
                            isCollapsed: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Add feedback',
                            hintStyle: GoogleFonts.roboto(fontSize: 14, color:AppColors.grayColor2, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    AppBtnWide(
                      text: 'Done',
                      textColor: AppColors.white,
                      bgColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(iindx: 3),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
