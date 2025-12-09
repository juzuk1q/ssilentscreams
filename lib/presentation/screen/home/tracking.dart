import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/presentation/screen/profile/order/deliveryReceipt.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Image.asset('assets/mapa.png'),
          Padding(
            padding: .all(20),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Text(
                  'Tracking Number',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: .w500,
                    color: AppColors.textColor1,
                  ),
                ),
                SizedBox(height: 20,),
                Row(children: [
                  SvgPicture.asset('assets/icons/idkWhatThis.svg'), SizedBox(width: 7,),
                  Text('R-7458-4567-4434-5854', style: GoogleFonts.roboto(fontSize: 16, color: AppColors.primaryColor),)
                ],),
                SizedBox(height: 15,),
                Text('Package Status', style: GoogleFonts.roboto(fontSize: 14, color: AppColors.grayColor2),)
              ],
            ),
          ),
          Spacer(),
          Row(
              mainAxisAlignment: .center,
              children: [
                AppBtnWide(
                  text: 'View Package Info',
                  textColor: AppColors.white,
                  bgColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => deliveryReceipt(),
                      ),
                    );
                  },
                ),
              ],
            ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
