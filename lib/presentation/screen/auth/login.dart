import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/app_textbox.dart';
import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/presentation/screen/auth/forgot_passwrd.dart';
import 'package:ssilentscreams/presentation/screen/auth/signup.dart';
import 'package:ssilentscreams/presentation/screen/home/home.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isChecked = false; // отвечает за запоминание пароля

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
              'Welcome Back',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textColor1,
              ),
            ), // большой текст
            Text(
              'Fill in your email and password to continue',
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.grayColor2,
              ),
            ), // маленький текст
            AppTextBox(
              labelName: 'Email Address',
              hintText: '***********@mail.com',
              showIcon: false,
            ), // поле для ввода почты
            AppTextBox(
              labelName: 'Password',
              hintText: '**********',
              showIcon: true,
            ), // поле для ввода пароля
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: AppColors.primaryColor,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: 4),
                ),
                Text('Remember password'),
                Spacer(),
                GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.roboto(color: AppColors.primaryColor),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPasswrdScreen()));},
                ),
              ],
            ), // запомнить пароль и забыли пароль
            SizedBox(height: MediaQuery.of(context).size.height * 0.334),
            Row(
              children: [
                Spacer(),
                AppBtnWide(
                  text: 'Log in',
                  textColor: AppColors.white,
                  bgColor: _isChecked
                      ? AppColors.primaryColor
                      : AppColors.grayColor2,
                  borderColor: _isChecked
                      ? AppColors.primaryColor
                      : AppColors.grayColor2,
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));},
                ),
                Spacer(),
              ],
            ), // кнопка входа
            SizedBox(height: 15),
            Center(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account? '),
                      GestureDetector(
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.roboto(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('or log in using'),
                  SizedBox(height: 5),
                  Image.asset('assets/icons/google.png'),
                ],
              ),
            ), // нижняя штука
          ],
        ),
      ),
    );
  }
}
