import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String? method = 'wallet';
  String? card = 'card1';

  double get heightcard {
    if (method == 'card') return MediaQuery.of(context).size.height * 0.276;
    return MediaQuery.of(context).size.height * 0.099;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: 15),
          customAppBar(title: 'Add Payment method'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Column(
            children: [
              Container(
                padding: .symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(1, 2.3),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(-1, 2.3),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(0, -0.01),
                      blurRadius: 3,
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.099,
                width: MediaQuery.of(context).size.width * 0.87,
                child: Row(
                  crossAxisAlignment: .center,
                  children: [
                    SizedBox(width: 2),
                    RadioTheme(
                      data: RadioThemeData(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.primaryColor; // цвет выбранного
                          }
                          return AppColors.primaryColor; // цвет обычного
                        }),
                        overlayColor: MaterialStateProperty.all(Colors.black12),
                      ),
                      child: Radio(
                        value: 'wallet',
                        groupValue: method,
                        onChanged: (value) {
                          setState(() {
                            method = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 2),
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text('Pay with wallet', style: GoogleFonts.roboto(fontSize: 16, color: AppColors.textColor1),),
                        Text('complete the payments using your wallet', style: GoogleFonts.roboto(fontSize: 12, color: AppColors.grayColor2),),
                      ],
                    ),
                  ],
                ),
              ), // walletka
              SizedBox(height: 23), // cards
              Container(
                padding: .only(top: 20, left: 2,),
                height: heightcard,
                width: MediaQuery.of(context).size.width * 0.87,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(1, 2.3),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(-1, 2.3),
                      blurRadius: 3,
                    ),
                    BoxShadow(
                      color: AppColors.textColor1.withAlpha(21),
                      offset: Offset(0, -0.01),
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: .center,
                      children: [
                        SizedBox(width: 2),
                        RadioTheme(
                          data: RadioThemeData(
                            fillColor: MaterialStateProperty.resolveWith((
                              states,
                            ) {
                              if (states.contains(MaterialState.selected)) {
                                return AppColors
                                    .primaryColor; // цвет выбранного
                              }
                              return AppColors.primaryColor; // цвет обычного
                            }),
                            overlayColor: MaterialStateProperty.all(
                              Colors.black12,
                            ),
                          ),
                          child: Radio(
                            value: 'card',
                            groupValue: method,
                            onChanged: (value) {
                              setState(() {
                                method = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 2),
                        Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .start,
                          children: [
                            Text('Credit / debit card', style: GoogleFonts.roboto(fontSize: 16, color: AppColors.textColor1),),
                            Text('complete the payment using your debit card', style: GoogleFonts.roboto(fontSize: 12, color: AppColors.grayColor2),),
                          ],
                        ),
                      ],
                    ),
                    if (method == 'card')
                      ?Column(
                        children: [
                          SizedBox(height: 8),
                          Container(
                            padding: .all(8),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.833,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(1, 2.3),
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(-1, 2.3),
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(0, -0.01),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                RadioTheme(
                                  data: RadioThemeData(
                                    fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states.contains(
                                          MaterialState.selected,
                                        )) {
                                          return AppColors
                                              .primaryColor; // цвет выбранного
                                        }
                                        return AppColors
                                            .primaryColor; // цвет обычного
                                      },
                                    ),
                                    overlayColor: MaterialStateProperty.all(
                                      Colors.black12,
                                    ),
                                  ),
                                  child: Radio(
                                    value: 'card1',
                                    groupValue: card,
                                    onChanged: (value) {
                                      setState(() {
                                        card = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text('**** **** 3323', style: GoogleFonts.roboto(fontSize: 16, color: AppColors.textColor1),),
                                Spacer(),
                                Image.asset('assets/icons/trash.png'),
                                SizedBox(width: 2),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: .all(8),
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.833,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(1, 2.3),
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(-1, 2.3),
                                  blurRadius: 3,
                                ),
                                BoxShadow(
                                  color: AppColors.textColor1.withAlpha(21),
                                  offset: Offset(0, -0.01),
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: .center,
                              children: [
                                RadioTheme(
                                  data: RadioThemeData(
                                    fillColor: MaterialStateProperty.resolveWith(
                                      (states) {
                                        if (states.contains(
                                          MaterialState.selected,
                                        )) {
                                          return AppColors.primaryColor; // цвет выбранного
                                        }
                                        return AppColors.primaryColor; // цвет обычного
                                      },
                                    ),
                                  ),
                                  child: Radio(
                                    value: 'card2',
                                    groupValue: card,
                                    onChanged: (value) {
                                      setState(() {
                                        card = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text('**** **** 1547', style: GoogleFonts.roboto(fontSize: 16, color: AppColors.textColor1),),
                                Spacer(),
                                Image.asset('assets/icons/trash.png'),
                                SizedBox(width: 2),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
-- main
width mdof.size.width * 0.87
height mdof.size.height * 0.19

-- wide
width mdof.size.width * 0.87
height mdof.size.height * 0.276

-- small
width mdof.size.width * 0.833
height mdof.size.height * 0.08
 */
