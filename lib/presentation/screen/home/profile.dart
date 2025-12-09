import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/presentation/screen/profile/notification.dart';
import 'package:ssilentscreams/presentation/screen/profile/payments.dart';
import 'package:ssilentscreams/presentation/screen/profile/order/sendOrderMenu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 15),
              customAppBar(title: 'Profile', showIcon: false,),
              Container(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 26,
                  top: 5,
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
                        _isHide ? Text('Current balance: @^*&%(@') : Text('Current balance: 0.02BTC'),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHide = !_isHide;
                        });
                      },
                      child: _isHide ? SvgPicture.asset('assets/icons/eyeNo.svg', height: 30,) : SvgPicture.asset('assets/icons/eye.svg', height: 30,)
                      ),
                  ],
                ),
              ),
              ProfileButton(
                icon: 'assets/icons/profile.svg',
                mainText: 'Edit Profile',
                description: 'Name, phone no, address, email address',
                bgColor: AppColors.white,
                onTap: () {},
              ),
              ProfileButton(
                icon: 'assets/icons/cert.svg',
                mainText: 'Statements & Reports',
                description: 'Download transaction details, orders, deliveries',
                bgColor: AppColors.white,
                onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => sendOrderMenu()),
                );},
              ),
              ProfileButton(
                icon: 'assets/icons/notification.svg',
                mainText: 'Notification Settings',
                description: 'mute, unmute, set location & tracking setting',
                bgColor: AppColors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => notifScreen()),
                  );
                },
              ),
              ProfileButton(
                icon: 'assets/icons/wallet_outline.svg',
                mainText: 'Card & Bank account settings',
                description: 'change cards, delete card details',
                bgColor: AppColors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WalletScreen()),
                  );
                },
              ),
              ProfileButton(
                icon: 'assets/icons/p2rson.svg',
                mainText: 'Referrals',
                description: 'check no of friends and earn',
                bgColor: AppColors.white,
                onTap: () {},
              ),
              ProfileButton(
                icon: 'assets/icons/map.svg',
                mainText: 'About Us',
                description: 'know more about us, terms of conditions',
                bgColor: AppColors.white,
                onTap: () {},
              ),
              ProfileButton(
                icon: 'assets/icons/logout.svg',
                mainText: 'Log Out',
                colorIcon: 0xffed3a3a,
                bgColor: AppColors.white,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
