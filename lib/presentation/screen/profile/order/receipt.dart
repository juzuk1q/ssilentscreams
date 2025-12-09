import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/data/datastorage.dart';
import 'makePayment.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';

class ReceiptMenu extends StatefulWidget {
  const ReceiptMenu({super.key});

  @override
  State<ReceiptMenu> createState() => _ReceiptMenuState();
}

class _ReceiptMenuState extends State<ReceiptMenu> {
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
    final origin = data!['origin'] ?? {};
    final destinations = data!['destination'] ?? [];
    final pkg = data!['package'] ?? {};

    if (data==null){
      return Scaffold(
        body: Center(child: Text('not loaded or NULL'),),
      );
    }

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
                            '${origin['address']}, ${origin['state']}',
                          ),
                          Text('${origin['phone']}'),
                          if ((origin['other'] ?? '').isNotEmpty) ...[
                            Text('other: ${origin['other']}'),
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
                            final d = e.value;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '  ${i + 1}.  ${d['address']}, ${d['stateCountry']}',
                                  ),
                                  Text('${d['phone']}'),
                                  if ((d['other'] ?? '').isNotEmpty) ...[
                                    Text('other: ${d['other']}'),
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
                                    Text('Package Items'),
                                    Text('Weight of items'),
                                    Text('Worth of items'),
                                    Text('Tracking Number'),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${pkg['items']}'),
                                    Text('${pkg['weight']}kg'),
                                    Text('${pkg['worth']}'),
                                    Text(
                                      'R-7458-4567-4434-5854',
                                      style: GoogleFonts.roboto(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ), // other details (pkg, weight, worth, trackNum)
                      SizedBox(height: 32),
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
                            Text('Charges'),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivery charges'),
                                      Text('Instant delivery'),
                                      Text('Tax and Service Charges'),
                                      Divider(
                                        color: Colors.grey, // цвет линии
                                        thickness: 1, // толщина линии
                                        indent: 0, // отступ слева
                                        endIndent: 0, // отступ справа
                                      ),
                                      Text('Package total'),
                                    ],
                                  ),
                                ), // parameters
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('2,500.00\$'),
                                      Text('300.00\$'),
                                      Text('200.00\$'),
                                      Divider(
                                        color: Colors.grey, // цвет линии
                                        thickness: 1, // толщина линии
                                        indent: 0, // отступ слева
                                        endIndent: 0, // отступ справа
                                      ),
                                      Text('3,000.00\$'),
                                    ],
                                  ),
                                ), // data
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 47),
                      Row(
                        children: [
                          AppBtnAvg(
                            text: 'Edit package',
                            textColor: AppColors.primaryColor,
                            bgColor: AppColors.white,
                            borderColor: AppColors.primaryColor,
                            onPressed: () {
                              Navigator.pop((context));
                            },
                          ),
                          SizedBox(width: 20),
                          AppBtnAvg(
                            text: 'Make payment',
                            textColor: AppColors.white,
                            bgColor: AppColors.primaryColor,
                            borderColor: AppColors.primaryColor,
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => paymentSuccess(),
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
