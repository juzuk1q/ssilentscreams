import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/splash.dart';
import 'package:ssilentscreams/presentation/screen/auth/login.dart';
import 'package:ssilentscreams/presentation/screen/auth/signup.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              ExpandablePageView(
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OnboardingWidget(
                    img: 'assets/images/splash/onboarding1.png',
                    mainText: 'Quick Delivery At Your Doorstep',
                    description:
                        'Enjoy quick pick-up and delivery to your destination',
                  ),
                  OnboardingWidget(
                    img: 'assets/images/splash/onboarding2.png',
                    mainText: 'Flexible Payment',
                    description:
                        'Different modes of payment either before and after delivery without stress',
                  ),
                  OnboardingWidget(
                    img: 'assets/images/splash/onboarding3.png',
                    mainText: 'Real-time Tracking',
                    description:
                        'Track your packages/items from the comfort of your home till final destination',
                  ),
                ],
              ),
              SizedBox(height: 70),
              Spacer(),
              Container(
                child: currentPage == 2
                    ? SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                AppBtnWide(
                                  text: 'Sign Up',
                                  textColor: AppColors.white,
                                  bgColor: AppColors.primaryColor,
                                  borderColor: AppColors.primaryColor,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Spacer(),
                                Text('Already have an account? '),
                                GestureDetector(
                                  child: Text(
                                    'Sign In',
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
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 20),
                                AppBtnSmall(
                                  text: 'Skip',
                                  textColor: AppColors.primaryColor,
                                  bgColor: AppColors.white,
                                  borderColor: AppColors.primaryColor,
                                  onPressed: () {
                                    controller.animateToPage(
                                      2,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeOutQuad,
                                    );
                                  },
                                ),
                                Spacer(),
                                AppBtnSmall(
                                  text: 'Next',
                                  textColor: AppColors.white,
                                  bgColor: AppColors.primaryColor,
                                  borderColor: AppColors.primaryColor,
                                  onPressed: () {
                                    controller.animateToPage(
                                      currentPage + 1,
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeOutQuad,
                                    );
                                  },
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
