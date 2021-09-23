import 'package:fl_chart/fl_chart.dart';
import 'package:smart_app/Services/size_config.dart';
import 'package:smart_app/constants.dart';
import 'package:smart_app/data/cards_data.dart';
import 'package:smart_app/data/transactions_data.dart';
import 'package:smart_app/Services/indicator.dart';

import 'package:smart_app/widgets/app_content.dart';
import 'package:smart_app/widgets/bank_card.dart';
import 'package:smart_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int touchedIndex = -1;
  int _cardIndex = 1;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(375, 812),
        orientation: Orientation.portrait);

    var cardHeading = Padding(
      padding: EdgeInsets.symmetric(
          // vertical: kSpacingUnit.w,
          // horizontal: kSpacingUnit.w * 2,
          ),
      child: Container(
        height: getProportionateScreenHeight(60),
        width: double.infinity,
        color: const Color(0xFF222D65),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.account_balance_wallet,
                    color: const Color(0xFFFBF8FF),
                    size: 25,
                  ),
                ),
                Text(
                  'Expense Report',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    color: const Color(0xFFFBF8FF),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFDFF0FF)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side:
                                  const BorderSide(color: Color(0xFFDFF0FF))))),
                  child: const Text('Add Expense',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222D65)))),
            )
          ],
        ),
      ),
    );

    var transactionHeading = Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ).copyWith(
        top: kSpacingUnit.w * 2,
        bottom: kSpacingUnit.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Transactions',
            style: kHeadingTextStyle,
          ),
          SvgPicture.asset(
            'assets/icons/more.svg',
            color: kTextSecondaryColor,
          )
        ],
      ),
    );

    var transactions = Expanded(
      child: ListView.builder(
        itemCount: transactionsMockData.length,
        itemBuilder: (BuildContext context, index) =>
            TransactionItem(transactionsMockData[index]),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            cardHeading,
            // start date - end date
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 35, bottom: 0),
              child: Text(
                'August 10, 2021 - Sept 10, 2021',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF212121),
                ),
              ),
            ),
            //Pie Chart Start
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, top: 0, bottom: 15, right: 24),
              child: Container(
                // height: 110,
                child: AspectRatio(
                  aspectRatio: 1.3,
                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFFBF8FF),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  pieTouchData: PieTouchData(touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {
                                    setState(() {
                                      if (!event.isInterestedForInteractions ||
                                          pieTouchResponse == null ||
                                          pieTouchResponse.touchedSection ==
                                              null) {
                                        touchedIndex = -1;
                                        return;
                                      }
                                      touchedIndex = pieTouchResponse
                                          .touchedSection!.touchedSectionIndex;
                                    });
                                  }),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 40,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Indicator(
                              color: Color(0xff0293ee),
                              text: 'Personnel',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xfff8b250),
                              text: 'Input',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xff845bef),
                              text: 'Rent',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Indicator(
                              color: Color(0xff13d38e),
                              text: 'Savings',
                              isSquare: true,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Expense Chart
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 8, bottom: 16),
              child: Text(
                'Expense Chart',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF212121),
                ),
              ),
            ),
            // cardHeading,
            // cardCarousel,
            transactionHeading,
            transactions,
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
