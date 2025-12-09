import 'package:flutter/material.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/data/datastorage.dart';
import 'package:flutter/services.dart';
import 'package:ssilentscreams/presentation/screen/profile/order/deliverySuccess.dart';

class deliveryReceipt extends StatefulWidget {
  const deliveryReceipt({super.key});

  @override
  State<deliveryReceipt> createState() => _deliveryReceiptState();
}

class _deliveryReceiptState extends State<deliveryReceipt> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    dataLoad();
  }

  Future<void> dataLoad() async {
    final loaded = await storage.loadOrder();
    setState(() {
      data = loaded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final origin = data?['origin'] ?? {};
    final destinations = data?['destination'] ?? [];
    final pkg = data?['package'] ?? {};

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        'Package Information',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ), // main text
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Origin details',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor2,
                            ),
                          ),
                          Text(
                            '${origin['address'] ?? ''}, ${origin['state'] ?? ''}',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: AppColors.grayColor2,
                            ),
                          ),
                          Text(
                            '${origin['phone'] ?? ''}',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: AppColors.grayColor2,
                            ),
                          ),
                          if ((origin['other'] ?? '').isNotEmpty) ...[
                            Text(
                              'other: ${origin['other'] ?? ''}',
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: AppColors.grayColor2,
                              ),
                            ),
                            SizedBox(height: 10),
                          ] else
                            SizedBox(height: 10),
                        ],
                      ), // origin
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Destination details',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor2,
                            ),
                          ),
                          ...destinations.asMap().entries.map((e) {
                            final i = e.key;
                            final d = e.value ?? {};
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  ${i + 1}.  ${d['address'] ?? ''}, ${d['stateCountry'] ?? ''}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: AppColors.grayColor2,
                                    ),
                                  ),
                                  Text(
                                    '${d['phone'] ?? ''}',
                                    style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      color: AppColors.grayColor2,
                                    ),
                                  ),
                                  if ((d['other'] ?? '').isNotEmpty) ...[
                                    Text(
                                      'other: ${d['other'] ?? ''}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.grayColor2,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ] else
                                    SizedBox(height: 10),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ), // destinations
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Other details',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor2,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Package Items',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.grayColor2,
                                      ),
                                    ),
                                    Text(
                                      'Weight of items',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.grayColor2,
                                      ),
                                    ),
                                    Text(
                                      'Worth of items',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.grayColor2,
                                      ),
                                    ),
                                    Text(
                                      'Tracking Number',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.grayColor2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${pkg['items'] ?? ''}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      '${pkg['weight'] ?? ''}kg',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      '${pkg['worth'] ?? ''}',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      'R-7458-4567-4434-5854',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ), // other details (pkg, weight, worth, trackNum)
                      SizedBox(height: 24),
                      // ------
                      Divider(
                        color: Colors.grey, // цвет линии
                        thickness: 1, // толщина линии
                        indent: 0, // отступ слева
                        endIndent: 0, // отступ справа
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Charges',
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                                fontWeight: .w500,
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Delivery charges',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.grayColor2,
                                        ),
                                      ),
                                      Text(
                                        'Instant delivery',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.grayColor2,
                                        ),
                                      ),
                                      Text(
                                        'Tax and Service Charges',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.grayColor2,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey, // цвет линии
                                        thickness: 1, // толщина линии
                                        indent: 0, // отступ слева
                                        endIndent: 0, // отступ справа
                                      ),
                                      Text(
                                        'Package total',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.grayColor2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // parameters
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '2,500.00\$',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        '300.00\$',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        '200.00\$',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey, // цвет линии
                                        thickness: 1, // толщина линии
                                        indent: 0, // отступ слева
                                        endIndent: 0, // отступ справа
                                      ),
                                      Text(
                                        '3,000.00\$',
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ), // data
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Click on delivered for successful delivery and rate rider or report missing item',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: .w400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          AppBtnAvg(
                            text: 'Report',
                            textColor: AppColors.primaryColor,
                            bgColor: AppColors.white,
                            borderColor: AppColors.primaryColor,
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                          SizedBox(width: 20),
                          AppBtnAvg(
                            text: 'Successful',
                            textColor: AppColors.white,
                            bgColor: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => deliverySuccess(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ), // main screen
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 15),
              customAppBar(title: 'Send a package'),
            ],
          ), // appbar
        ],
      ),
    );
  }
}
