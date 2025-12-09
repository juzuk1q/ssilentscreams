import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileButton extends StatelessWidget {
  final String icon;
  final colorIcon;
  final String mainText;
  final String? description;
  final bgColor;
  final VoidCallback onTap;

  const ProfileButton({
    super.key,
    required this.icon,
    this.colorIcon,
    required this.mainText,
    this.description,
    required this.bgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(12),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(),
        ),
        child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(height: 5, width: 35),
                  SvgPicture.asset(
                    icon,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      Color(colorIcon ?? 0xff292D32),
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: description == null
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor1,
                    ),
                  ),
                  if (description != null)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text(
                          description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayColor2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class customAppBar extends StatelessWidget {
  final bool? showIcon;
  final String title;

  const customAppBar({super.key, required this.title, this.showIcon = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x20000000),
            offset: Offset(0, -17),
            blurRadius: 4,
          ),
          BoxShadow(color: Color(0xffFFFFFF), offset: Offset(0, -20)),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            children: [
              showIcon == true
                  ? GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/arrowLeft.svg',
                        height: 30,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      onTap: () => Navigator.of(context).pop(),
                    )
                  : SvgPicture.asset(
                      'assets/icons/arrowLeft.svg',
                      height: 30,
                      colorFilter: ColorFilter.mode(
                        AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
              Spacer(),
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayColor2,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Opacity(
                opacity: 0,
                child: GestureDetector(
                  child: SvgPicture.asset('assets/icons/car.svg', width: 30),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileBanner extends StatelessWidget {
  final String user;
  final bool? haveIcon;

  const ProfileBanner({super.key, required this.user, this.haveIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.13,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, Color(0xff0560fa)],
                begin: .topLeft,
                end: .bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: -35,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                color: Color(0xff005ece),
                shape: BoxShape.circle,
              ),
            ),
          ), // left circle
          Positioned(
            bottom: 35,
            right: -40,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                color: Color(0xff005ece),
                shape: BoxShape.circle,
              ),
            ),
          ), // right circle
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.white, width: 4),
              color: AppColors.white.withOpacity(0),
            ),
          ), // border
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.white, width: 4.75),
              color: AppColors.white.withOpacity(0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 12),
                haveIcon == false
                    ? CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.black,
                        ),
                      )
                    : Container(
                  height: 60, width: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/profile.png'),
                            fit: .contain
                          ),
                          borderRadius: .circular(60),
                          border: .all(color: AppColors.white, width: 1)
                        ),
                      ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Hello $user!",
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: AppColors.white,
                          fontWeight: .w500,
                        ),
                      ),
                      Text(
                        "We trust you are having a great time",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Color(0xffCFCFCF),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/notification.svg',
                  height: 30,
                  colorFilter: .mode(AppColors.white, .srcIn),
                ),
                SizedBox(width: 14),
              ],
            ),
          ), // border with data
        ],
      ),
    );
  }
}

class HomeBtn extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const HomeBtn({super.key, required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: .all(10),
      // height: MediaQuery.of(context).size.width*0.4,
      // width: MediaQuery.of(context).size.width*0.4,
      decoration: BoxDecoration(
        color: Color(0xffF2F2F2),
        borderRadius: .circular(12),
        boxShadow: [
          BoxShadow(color: AppColors.textColor1.withAlpha(20), offset: Offset(3, 6), blurRadius: 5),
          BoxShadow(color: AppColors.textColor1.withAlpha(20), offset: Offset(-3, 6), blurRadius: 5),
        ]
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Spacer(),
          SvgPicture.asset(icon, height: 35, colorFilter: .mode(AppColors.primaryColor, .srcIn),),
          SizedBox(height: 4,),
          Text(title, style: GoogleFonts.roboto(fontSize: 16, fontWeight: .w500, color: AppColors.primaryColor), textAlign: .center,),
          SizedBox(height: 4,),
          Text(description, style: GoogleFonts.roboto(fontSize: 7.75, height: 1.15)),
          Spacer(),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(20),
      height: MediaQuery.of(context).size.height * 0.123,
      width: MediaQuery.of(context).size.width,
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 17,),
          Container(
            height: MediaQuery.of(context).size.height*0.052,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.grayColor1,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search services',
                      hintStyle: GoogleFonts.roboto(color: AppColors.grayColor2, fontSize: 12),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/search.svg', colorFilter: .mode(AppColors.grayColor2, .srcIn))],
            ),
          ),
        ],
      ),
    );
  }
}
