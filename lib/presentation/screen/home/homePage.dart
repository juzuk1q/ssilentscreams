import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final items = [
    {
      'icon': 'assets/icons/customer.svg',
      'title': 'Customer Care',
      'description':
          'Our customer care service line is available from 8 -9pm week days and 9 - 5 weekends - tap to call us today',
    },
    {
      'icon': 'assets/icons/pkg.svg',
      'title': 'Send a package',
      'description':
          'Request for a driver to pick up or deliver your package for you',
    },
    {
      'icon': 'assets/icons/wallet.svg',
      'title': 'Fund your wallet',
      'description':
          'To fund your wallet is as easy as ABC, make use of our fast technology and top-up your wallet today',
    },
    {
      'icon': 'assets/icons/chat.svg',
      'title': 'Chats',
      'description': 'Search for available rider within your area',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: .all(20),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                  ProfileBanner(user: 'Ken', haveIcon: true),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Special for you',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: .w500,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/icons/arrowRight.svg',
                          colorFilter: .mode(AppColors.secondaryColor, .srcIn),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Image.asset('assets/images/banner1.png'),
                      Spacer(),
                      Image.asset('assets/images/banner2.png'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: .centerLeft,
                    child: Text('What would you like to do'),
                  ),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];

                        return HomeBtn(
                          icon: item['icon'].toString(),
                          title: item['title'].toString(),
                          description: item['description'].toString(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: .center,
            children: [SizedBox(height: 20), CustomSearchBar()],
          ),
        ],
      ),
    );
  }
}
