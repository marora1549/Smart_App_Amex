import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_app/Services/indicator.dart';
import 'package:smart_app/Services/size_config.dart';
import 'package:smart_app/constants.dart';
import 'package:smart_app/models/card_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:smart_app/Services/line_chart_utility.dart';
import 'package:smart_app/widgets/categories.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  late bool isShowingMainData;
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222D65),
        elevation: 0,
        // leadingWidth: 100.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          // padding: const EdgeInsets.only(left: 8),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Analytics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                '12 Tools',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            //Credit Score
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text('Credit Score',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF212121),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //left side
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Risk Assessment',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: 50,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF8ACA72),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    child: const Center(
                                      child: Text('4/5',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          )),
                                    )),
                                const SizedBox(width: 10),
                                const Text('Credit Score',
                                    style: TextStyle(
                                        color: Color(0xFF222D65),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Eligible for Credit Card',
                              style: TextStyle(
                                  color: HexColor.fromHex("616575"),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: 160,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFFDFF0FF)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              side: const BorderSide(
                                                  color: Color(0xFFDFF0FF))))),
                                  child: const Text('Limit - Rs 2.0L',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF222D65)))),
                            )
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 8, color: Colors.grey.shade200)),
                                child: Center(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFDFF0FF)),
                                    child: const ClipOval(
                                        child: Icon(
                                      Icons.monetization_on_outlined,
                                      color: Color(0xFF222D65),
                                    )),
                                  ),
                                )),
                            Positioned(
                              top: 5,
                              left: 5,
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0.0, end: 0.80),
                                  duration: const Duration(milliseconds: 1000),
                                  builder: (context, value, _) => Container(
                                    width: 90,
                                    height: 90,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 8,
                                        value: value,
                                        color: const Color(0xFFADD9FF)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ])),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 18, bottom: 0),
              child: Text(
                'Tools',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF212121),
                ),
              ),
            ),
            Categories(),
            //multiple line graph start
            // SizedBox(height: 20),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
