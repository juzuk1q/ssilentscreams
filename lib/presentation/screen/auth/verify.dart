import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_passwrd.dart';
import 'dart:async';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController _pinController = TextEditingController();
  int seconds = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    seconds = 60;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      seconds > 0
          ? setState(() {
            seconds--;
          })
          : t.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text('OTP Verification', style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor1,
            ),),
            Text('Enter the 6 digit numbers sent to your email', style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.grayColor2,
            ),),
            SizedBox(height: 30),
            Pinput(
              length: 6,
              autofocus: true,
              onCompleted: (pin) {
                setState(() => pin != '555555');
                if (pin == '555555') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPasswrdScreen()),
                  );
                }
              },
            ),
            Row(
              children: [
                Text('If you didn\'t receive code, ', style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayColor2,
                ),),
                seconds > 0
                ? Text('resend after ${seconds ~/ 60}:${(seconds % 60).toString().padLeft(2, '0')}', style: GoogleFonts.roboto(color: AppColors.grayColor2, fontSize: 14, fontWeight: FontWeight.w700),)
                : GestureDetector(child: Text('resend', style: GoogleFonts.roboto(color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w700),), onTap: () {startTimer();},)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
