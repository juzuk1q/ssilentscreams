import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssilentscreams/core/widget/app_button.dart';
import 'package:ssilentscreams/core/widget/app_textbox.dart';
import 'package:ssilentscreams/core/widget/home_buttom.dart';
import 'package:ssilentscreams/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssilentscreams/data/datastorage.dart';
import 'package:ssilentscreams/presentation/screen/profile/order/receipt.dart';

class sendOrderMenu extends StatefulWidget {
  const sendOrderMenu({super.key});

  @override
  State<sendOrderMenu> createState() => _sendOrderMenuState();
}

class _sendOrderMenuState extends State<sendOrderMenu> {
  // ---- origin
  final originAddress = TextEditingController();
  final originStateCountry = TextEditingController();
  final originPhoneNumber = TextEditingController();
  final originOthers = TextEditingController();

  // ---- pkg details
  final pkgItems = TextEditingController();
  final pkgWeight = TextEditingController();
  final pkgWorth = TextEditingController();

  List<Destination> destinations = [Destination()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                //  --- 1 блок ---
                Row(
                  children: [
                    SizedBox(height: 40, width: 05),
                    SvgPicture.asset('assets/icons/details.svg', width: 20),
                    SizedBox(width: 9),
                    Text('Origin Details'),
                  ],
                ),
                ProfileTextBox(controller: originAddress, hinText: 'Address'),
                SizedBox(height: 7),
                ProfileTextBox(
                  controller: originStateCountry,
                  hinText: 'State, Country',
                ),
                SizedBox(height: 7),
                ProfileTextBox(
                  controller: originPhoneNumber,
                  hinText: 'Phone number',
                ),
                SizedBox(height: 7),
                ProfileTextBox(controller: originOthers, hinText: 'Others'),
                // --- [ end ] ---
                SizedBox(height: 20),
                //  --- 2 блок ---
                Column(
                  children: List.generate(
                    destinations.length,
                    (index) => Destinations(data: destinations[index]),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5),
                    GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/addSquare.svg',
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          destinations.add(Destination());
                        });
                      },
                    ),
                    SizedBox(width: 6),
                    Text('Add destination'),
                  ],
                ), // -- add destination
                // --- [ end ] ---
                SizedBox(height: 13),
                //  --- 3 блок ---
                Row(
                  children: [
                    SizedBox(height: 40, width: 5),
                    Text(
                      'Package Details',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ProfileTextBox(controller: pkgItems, hinText: 'package items'),
                SizedBox(height: 7),
                ProfileTextBox(
                  controller: pkgWeight,
                  hinText: 'Weight of item(kg)',
                ),
                SizedBox(height: 7),
                ProfileTextBox(controller: pkgWorth, hinText: 'Worth of items'),
                // --- [ ] ---
                SizedBox(height: 30),
                // --- 4 блок ---
                Row(
                  children: [
                    SizedBox(height: 30, width: 5),
                    Text(
                      'Select delivery type',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 9),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PkgButton(
                      icon: 'assets/icons/clock.svg',
                      text: 'Instant delivery',
                      textColor: AppColors.white,
                      bgColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onPressed: () async {
                        final order = {
                          'origin': {
                            'address': originAddress.text,
                            'state': originStateCountry.text,
                            'phone': originPhoneNumber.text,
                            'other': originOthers.text,
                          },
                          'destination': destinations.map((d) {
                            return {
                              'address': d.address.text,
                              'state': d.stateCountry.text,
                              'phone': d.phoneNumber.text,
                              'other': d.other.text,
                            };
                          }).toList(),
                          'package': {
                            'items': pkgItems.text,
                            'weight': pkgWeight.text,
                            'worth': pkgWorth.text,
                          }
                        };
                        await storage.saveOrder(order);

                        print(order);
                        
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReceiptMenu()));
                      },
                    ),
                    SizedBox(width: 25),
                    PkgButton(
                      icon: 'assets/icons/calendar.svg',
                      text: 'Scheduled delivery',
                      textColor: AppColors.grayColor2,
                      bgColor: AppColors.white,
                      borderColor: AppColors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 15),
              customAppBar(title: 'Send a package'),
            ],
          ),
        ],
      ),
    );
  }
}

class Destination {
  final TextEditingController address = TextEditingController();
  final TextEditingController stateCountry = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController other = TextEditingController();
} // dataclass of destinations

class Destinations extends StatelessWidget {
  final Destination data;

  const Destinations({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 40, width: 10),
            SvgPicture.asset('assets/icons/marker.svg', height: 20),
            SizedBox(width: 13),
            Text('Destination Details'),
          ],
        ), // label
        ProfileTextBox(controller: data.address, hinText: 'Address'),
        SizedBox(height: 7),
        ProfileTextBox(controller: data.stateCountry, hinText: 'State, Country'),
        SizedBox(height: 7),
        ProfileTextBox(controller: data.phoneNumber, hinText: 'Phone number'),
        SizedBox(height: 7),
        ProfileTextBox(controller: data.other, hinText: 'Others'),
        SizedBox(height: 10),
      ],
    );
  }
} // widget with destinations textboxes
