import 'package:flutter/material.dart';
import 'package:smart_app/Screens/analytics.dart';
import 'package:smart_app/Screens/apply_loan_form.dart';
import 'package:smart_app/Screens/social.dart';
import 'package:smart_app/Services/size_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Special for you",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: const Color(0xFF222D65),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "See More>",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      color: const Color(0xFF179BD7)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/image_banner_3.jpg",
                category: "Loan Applications",
                tagLine: "2 Pending",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplyLoanForm()),
                  );
                },
              ),
              SpecialOfferCard(
                image: "assets/images/image_banner_4.jpg",
                category: "Analytics",
                tagLine: "12 new tools",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Analytics()),
                  );
                },
              ),
              SpecialOfferCard(
                image: "assets/images/image_banner_5.jpg",
                category: "SME Social",
                tagLine: "5 Notifications",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Social()),
                  );
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.tagLine,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final String tagLine;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: InkWell(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        const Color(0xFF343434).withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: tagLine)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
