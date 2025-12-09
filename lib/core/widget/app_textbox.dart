import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppTextBox extends StatefulWidget {
  final String labelName;
  final String hintText;
  final bool showIcon;

  const AppTextBox({
    super.key,
    required this.labelName,
    required this.hintText,
    required this.showIcon,
  });

  @override
  State<AppTextBox> createState() => _AppTextBoxState();
}

class _AppTextBoxState extends State<AppTextBox> {
  bool _obscText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          widget.labelName,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.grayColor2,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscuringCharacter: '*',
          obscureText: widget.showIcon ? _obscText : false,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.textColor1,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.grayColor2,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: AppColors.grayColor2, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.0),
            ),
            suffixIcon: widget.showIcon
                ? IconButton(
                    icon: Icon(
                      _obscText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textColor1,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscText = !_obscText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class ProfileTextBox extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;

  const ProfileTextBox({super.key, required this.controller, required this.hinText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 44,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor1.withAlpha(21),
            offset: Offset(2, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: AppColors.textColor1.withAlpha(7),
            offset: Offset(1, -2.3),
            blurRadius: 3,
          ),
          BoxShadow(color: AppColors.white, offset: Offset(-2.4, -2))
        ],
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.roboto(fontSize: 14, color: AppColors.textColor1),
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.zero,
          hintText: hinText,
          hintStyle: GoogleFonts.roboto(fontSize: 14, color:AppColors.grayColor2, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
