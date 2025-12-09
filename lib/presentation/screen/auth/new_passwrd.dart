import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/app_textbox.dart';
import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/presentation/screen/home/home.dart';

class NewPasswrdScreen extends StatefulWidget {
  const NewPasswrdScreen({super.key});

  @override
  State<NewPasswrdScreen> createState() => _NewPasswrdScreenState();
}

class _NewPasswrdScreenState extends State<NewPasswrdScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              'New Password',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textColor1,
              ),
            ),
            Text(
              'Enter new password',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grayColor2,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
            AppTextBox(
              labelName: 'Password',
              hintText: '**********',
              showIcon: true,
            ),
            AppTextBox(
              labelName: 'Confirm Password',
              hintText: '**********',
              showIcon: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            Row(
              children: [
                Spacer(),
                AppBtnWide(
                  text: 'Log in',
                  textColor: AppColors.white,
                  bgColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
