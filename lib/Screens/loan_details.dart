import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:smart_app/Screens/apply_loan_form.dart';

class LoanDetails extends StatefulWidget {
  const LoanDetails({Key? key}) : super(key: key);

  @override
  _LoanDetailsState createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222D65),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 8),
        ),
        // automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Finance Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: const Color(0xFFDFF0FF),
              expandedColor: Colors.red[50],
              key: cardA,
              leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.cyan[50],
                  child: Image.asset("assets/images/logo_with_title.png")),
              title: const Text("Free Scale Posters"),
              subtitle: const Text(
                "Amount Required:\nRs 35,000",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Type: Short Term\nDuration: 2 Months\nStart Date: October 1,2021\n"
                      "Reason: Unusual demand detected historically",
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.expand();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ApplyLoanForm()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on_outlined),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Apply Loan'),
                        ],
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: ExpansionTileCard(
              baseColor: const Color(0xFFDFF0FF),
              expandedColor: const Color(0xFFEBF5FFFF),
              key: cardB,
              leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.cyan[50],
                  child: Image.asset("assets/images/logo_with_title.png")),
              title: const Text("Free Scale Posters"),
              subtitle: const Text(
                "Amount Required:\nRs 15,000",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Type: Short Term\nDuration: 1 Months\nStart Date: October 1,2021\n"
                      "Reason: Operational costs imbalance\n*Suggested use of credit card*",
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardB.currentState?.expand();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ApplyLoanForm()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.monetization_on_outlined),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Apply Loan'),
                        ],
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      onPressed: () {
                        // cardB.currentState?.collapse();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ApplyLoanForm()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.credit_card_rounded),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Get Card'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
