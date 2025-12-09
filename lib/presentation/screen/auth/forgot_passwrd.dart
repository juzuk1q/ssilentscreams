import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/app_textbox.dart';
import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/presentation/screen/auth/login.dart';
import 'package:ssilentscreams/presentation/screen/auth/verify.dart';

class ForgotPasswrdScreen extends StatefulWidget {
  const ForgotPasswrdScreen({super.key});

  @override
  State<ForgotPasswrdScreen> createState() => _ForgotPasswrdScreenState();
}

class _ForgotPasswrdScreenState extends State<ForgotPasswrdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.all(37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text('Forgot Password', style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor1,
            ),),
            Text('Enter your email address', style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.grayColor2,
            ),),
            SizedBox(height: 30),
            AppTextBox(
              labelName: 'Email Address',
              hintText: '***********@mail.com',
              showIcon: false,
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Spacer(),
                AppBtnWide(
                  text: 'Send OTP',
                  textColor: AppColors.white,
                  bgColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPVerification()));},
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 15),
            Center(
              child: Column(
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Remember password? Back to ', style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grayColor2,
                      ),),
                      GestureDetector(
                        child: Text('Sign in', style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primaryColor),),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LogInScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
