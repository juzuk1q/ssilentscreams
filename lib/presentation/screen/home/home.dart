import 'profile.dart';
import 'homePage.dart';
import 'walletka.dart';
import 'tracking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';


class HomeScreen extends StatefulWidget {
  final int iindx;

  const HomeScreen({Key? key, this.iindx = 0}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _indx;

  final List<Widget> _widgetOption = <Widget>[
    HomePageScreen(),
    WalletScreen(),
    TrackingScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _indx = widget.iindx;
  }

  void _onItemTapped(int index) {
    setState(() {
      _indx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(child: _widgetOption.elementAt(_indx)),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              colorFilter: ColorFilter.mode(
                AppColors.grayColor2,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset('assets/icons/home_solid.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wallet_outline.svg',
              colorFilter: ColorFilter.mode(
                AppColors.grayColor2,
                BlendMode.srcIn,
              ),
            ),
            label: 'Wallet',
            activeIcon: SvgPicture.asset(
              'assets/icons/wallet.svg',
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Car.svg',
              colorFilter: ColorFilter.mode(
                AppColors.grayColor2,
                BlendMode.srcIn,
              ),
            ),
            label: 'Track',
            activeIcon: SvgPicture.asset('assets/icons/car_solid.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              colorFilter: ColorFilter.mode(
                AppColors.grayColor2,
                BlendMode.srcIn,
              ),
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              'assets/icons/profile_solid.svg', // здесь по другому мб и можно, но у меня только бордеры красятся
            ),
          ),
        ],
        currentIndex: _indx,
        onTap: _onItemTapped,
      ),
    );
  }
}
