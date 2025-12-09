import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 26,
                  top: 30,
                  bottom: 15,
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profile.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello Ken'),
                        _isHide
                            ? Text('Current balance: @^*&%(@')
                            : Text('Current balance: 0.02BTC'),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHide = !_isHide;
                        });
                      },
                      child: _isHide
                          ? SvgPicture.asset(
                              'assets/icons/eyeNo.svg',
                              height: 30,
                            )
                          : SvgPicture.asset(
                              'assets/icons/eye.svg',
                              height: 30,
                            ),
                    ),
                  ],
                ),
              ), // profile
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 0.88,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 48),
                decoration: BoxDecoration(
                  color: AppColors.grayColor1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Top Up',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        circleBtn(
                          label: 'Bank',
                          img: 'assets/icons/bank.svg',
                          onPressed: () {
                            print('1');
                          },
                        ),
                        Spacer(),
                        circleBtn(
                          label: 'Transfer',
                          img: 'assets/icons/transfer.svg',
                          onPressed: () {
                            print('2');
                          },
                        ),
                        Spacer(),
                        circleBtn(
                          label: 'Card',
                          img: 'assets/icons/card2.svg',
                          onPressed: () {
                            print('print("hello world");');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(24),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction history',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 14),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 6,
                            children: [
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                              transaction(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 15),
              customAppBar(title: 'Wallet', showIcon: false),
            ],
          ),
        ],
      ),
    );
  }
}

class circleBtn extends StatelessWidget {
  final String label;
  final String img;
  final VoidCallback onPressed;

  const circleBtn({
    super.key,
    required this.label,
    required this.img,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20), // размер кнопки (круглый)
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                img,
                colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: GoogleFonts.roboto(fontSize: 12, color: AppColors.textColor1),
        ),
      ],
    );
  }
}

class transaction extends StatelessWidget {
  const transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      color: AppColors.grayColor1.withAlpha(40),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '-1,000.00\$',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.errorColor,
                  ),
                ),
                Text(
                  'Delivery fee',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'July 7, 2022',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: AppColors.grayColor2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
