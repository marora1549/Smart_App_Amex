import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_app/Services/size_config.dart';
import 'package:smart_app/data/cards_data.dart';
import 'package:smart_app/widgets/bank_card.dart';
import 'package:smart_app/widgets/profile_menu.dart';

import '../constants.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _cardIndex = 1;

  @override
  Widget build(BuildContext context) {
    // User user = Provider.of<User>(context);
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        orientation: Orientation.portrait);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF222D65),
          leading: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            // padding: const EdgeInsets.only(left: 8),
          ),
          title: Text("Profile"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // SizedBox(
              //   height: 115,
              //   width: 115,
              //   child: Stack(
              //     fit: StackFit.expand,
              //     clipBehavior: Clip.none,
              //     children: [
              //       const CircleAvatar(
              //         backgroundImage:
              //             AssetImage("assets/images/profile_image.jpeg"),
              //       ),
              //       Positioned(
              //         right: -16,
              //         bottom: 0,
              //         child: SizedBox(
              //           height: 46,
              //           width: 46,
              //           child: TextButton(
              //             style: TextButton.styleFrom(
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(50),
              //                 side: BorderSide(color: Colors.white),
              //               ),
              //               primary: Colors.white,
              //               backgroundColor: Color(0xFFF5F6F9),
              //             ),
              //             onPressed: () {},
              //             child:
              //                 SvgPicture.asset("assets/icons/Camera Icon.svg"),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: 20),
              Text(
                'My Cards',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: const Color(0xFF222D65),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Stack(
                children: <Widget>[
                  CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 240.w,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: _cardIndex,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _cardIndex = index;
                          });
                        },
                      ),
                      itemCount: cardsMockData.length,
                      itemBuilder: (context, index, realIdx) {
                        return BankCard(cardsMockData[index]);
                      }),
                  Positioned(
                    bottom: kSpacingUnit.w * 2,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cardsMockData.map((card) {
                        return Container(
                          width: kSpacingUnit.w,
                          height: kSpacingUnit.w,
                          margin: EdgeInsets.symmetric(
                              horizontal: kSpacingUnit.w / 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                cardsMockData[_cardIndex].number == card.number
                                    ? kPrimaryColor
                                    : Colors.transparent,
                            border: Border.all(
                              color: kPrimaryColor,
                              width: 1.5,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {},
              ),
              ProfileMenu(
                text: "Notifications",
                icon: "assets/icons/Bell.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {},
              ),
            ],
          ),
        ));
  }
}
