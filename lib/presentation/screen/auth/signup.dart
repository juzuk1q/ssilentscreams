import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/app_textbox.dart';
import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/presentation/screen/auth/login.dart';
import 'package:ssilentscreams/presentation/screen/home/home.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(37),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.048),
              Text(
                'Create an account',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textColor1,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                'Complete the sign up process to get started',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.grayColor2,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 15),
              AppTextBox(
                labelName: 'Full name',
                hintText: 'Ivanov Ivan',
                showIcon: false,
              ),
              AppTextBox(
                labelName: 'Phone Number',
                hintText: '+7(999)999-99-99',
                showIcon: false,
              ),
              AppTextBox(
                labelName: 'Email Address',
                hintText: 'name@domainname.com',
                showIcon: false,
              ),
              AppTextBox(
                labelName: 'Password',
                hintText: '************',
                showIcon: true,
              ),
              AppTextBox(
                labelName: 'Confirm Password',
                hintText: '************',
                showIcon: true,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    activeColor: AppColors.primaryColor,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                    visualDensity: VisualDensity(horizontal: -4),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColors.textColor1, // общий стиль текста
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(
                            text: 'By ticking this box, you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms and conditions and privacy policy',
                            style: const TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Действие при клике на ссылку
                                print('Tapped Terms and Conditions');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Spacer(),
                  AppBtnWide(
                    text: 'Sign Up',
                    textColor: AppColors.white,
                    bgColor: _isChecked
                        ? AppColors.primaryColor
                        : AppColors.grayColor2,
                    borderColor: _isChecked
                        ? AppColors.primaryColor
                        : AppColors.grayColor2,
                    onPressed: () {
                      if (!_isChecked) return print('not checked');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                        GestureDetector(
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.roboto(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogInScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('or sign up using'),
                    SizedBox(height: 5),
                    Image.asset('assets/icons/google.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
