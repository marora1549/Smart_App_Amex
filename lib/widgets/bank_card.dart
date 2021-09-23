import 'package:smart_app/constants.dart';
import 'package:smart_app/models/card_detail_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BankCard extends StatelessWidget {
  final CardDetail cardDetail;

  BankCard(this.cardDetail);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.all(kSpacingUnit.w).copyWith(bottom: kSpacingUnit.w * 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(this.cardDetail.background),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: kShadowColor2,
            blurRadius: kSpacingUnit.w * 3,
            offset: Offset(0, kSpacingUnit.w * 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(kSpacingUnit.w * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/American_Express.svg',
                  width: 55,
                ),
                SvgPicture.asset(
                  'assets/icons/more.svg',
                  color: Colors.white,
                ),
              ],
            ),
            Text(
              this.cardDetail.number,
              style: kCardTextStyle.copyWith(
                fontSize: ScreenUtil().setSp(21),
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: <Widget>[
                BankCardField(
                  label: 'Card Holder',
                  value: this.cardDetail.name,
                ),
                Spacer(),
                BankCardField(
                  label: 'Expiry',
                  value: this.cardDetail.expiry,
                ),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BankCardField extends StatelessWidget {
  final String label;
  final String value;

  BankCardField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label \n',
            style: kCardTextStyle.copyWith(
              fontSize: ScreenUtil().setSp(9),
            ),
          ),
          TextSpan(
            text: this.value,
            style: kCardTextStyle.copyWith(
              height: 1.5,
              fontSize: ScreenUtil().setSp(13),
            ),
          ),
        ],
      ),
    );
  }
}
