import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';

class notifScreen extends StatefulWidget {
  const notifScreen({super.key});

  @override
  State<notifScreen> createState() => _notifScreenState();
}

class _notifScreenState extends State<notifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: 15,),
          customAppBar(title: 'Notification',),
          Center(child: Column(
            children: [
              SizedBox(height: 50,),
              SvgPicture.asset('assets/icons/notification.svg', height: 85, colorFilter: ColorFilter.mode(AppColors.grayColor2, BlendMode.srcIn),),
              Text('You have no notification.'),
            ],
          ),)
        ],
      ),
    );
  }
}
