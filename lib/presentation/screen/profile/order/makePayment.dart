import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/presentation/screen/home/home.dart';

class paymentSuccess extends StatefulWidget {
  const paymentSuccess({super.key});

  @override
  State<paymentSuccess> createState() => _paymentSuccessState();
}

class _paymentSuccessState extends State<paymentSuccess> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1, milliseconds: 500),
    )..repeat();
    
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        show =true;
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
                ? Image.asset('assets/images/success.png', height: 150, width: 150,)
                : RotationTransition(turns: Tween(begin: 0.0, end: -1.0).animate(_controller), child: Image.asset('assets/images/load1.png', width: 150, height: 150,),),
                SizedBox(height: 75,),
                show
                ? Text('Transaction Successful', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w500),)
                : Text('Transaction Successful', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.white),),
                SizedBox(height: 8),
                Text('Your rider is on the way to your destination'),
                SizedBox(height: 4,),
                Text('Tracking Number R-7458-4567-4434-5854'),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    AppBtnWide(
                      text: 'Track my item',
                      textColor: AppColors.white,
                      bgColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(iindx: 2),
                          ),
                        );
                      },
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 8),
                AppBtnWide(
                  text: 'Go back to homepage',
                  textColor: AppColors.primaryColor,
                  bgColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
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