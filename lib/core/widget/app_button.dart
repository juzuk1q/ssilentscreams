import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBtnSmall extends StatelessWidget {
  final String text;
  final textColor;
  final bgColor;
  final borderColor;
  final VoidCallback? onPressed;

  const AppBtnSmall({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(100, 50),
        foregroundColor: textColor,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(color: borderColor, width: 1.5),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AppBtnWide extends StatelessWidget {
  final String text;
  final textColor;
  final bgColor;
  final borderColor;
  final VoidCallback onPressed;

  const AppBtnWide({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(MediaQuery.of(context).size.height * 0.36, 48),
        foregroundColor: textColor,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: BorderSide(color: borderColor, width: 1.5),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AppBtnAvg extends StatelessWidget {
  final String text;
  final textColor;
  final bgColor;
  final borderColor;
  final VoidCallback? onPressed;

  const AppBtnAvg({
    super.key,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          foregroundColor: textColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: borderColor, width: 1.5),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ),
    );
  }
}


class PkgButton extends StatelessWidget {
  final String text;
  final textColor;
  final bgColor;
  final borderColor;
  final icon;
  final VoidCallback? onPressed;

  const PkgButton({
    super.key,
    required this.icon,
    required this.text,
    required this.textColor,
    required this.bgColor,
    required this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width*0.2, 75),
          foregroundColor: textColor,
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color: borderColor, width: 1.5),
        ),
        onPressed: onPressed,
        child: Column(
          children: [
            SvgPicture.asset(icon, colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),),
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

