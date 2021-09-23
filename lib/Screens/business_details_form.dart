import 'package:flutter/material.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String industry = 'Consumer Goods';
    String _finance_type = 'Private Bank';

    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/top1.png", width: size.width),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/top2.png", width: size.width),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:
                  Image.asset("assets/images/bottom1.png", width: size.width),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:
                  Image.asset("assets/images/bottom2.png", width: size.width),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Add your business details
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Step2: Add Your Business Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF222D65),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      // height: size.height * 0.8,
                      width: size.width * 0.9,
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          // physics: const ClampingScrollPhysics(),
                          children: <Widget>[
                            const SizedBox(height: 15),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Business Name",
                                ),
                              ),
                            ),
                            // SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Business License Number",
                                ),
                              ),
                            ),
                            // SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Annual Revenue"),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton<String>(
                                focusColor: Colors.black,
                                value: industry,
                                //elevation: 5,
                                style: const TextStyle(color: Colors.black),
                                iconEnabledColor: Colors.black,
                                items: <String>[
                                  'Consumer Goods',
                                  'Metal',
                                  'Printing',
                                  'Food',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: const Text(
                                  "Industry",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    industry = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Text(
                                'Annual Expenses',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF222D65),
                                ),
                              ),
                            ),
                            // SizedBox(height: size.height * 0.03),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Cost of Goods(Sold)",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Operating Cost",
                                ),
                              ),
                            ),
                            // SizedBox(height: size.height * 0.03),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Personnel Cost",
                                ),
                              ),
                            ),
                            // SizedBox(width: 10),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Other Expenses",
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: const Text(
                                'Finances',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF222D65),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: DropdownButton<String>(
                                focusColor: Colors.white,
                                value: _finance_type,
                                //elevation: 5,
                                style: const TextStyle(color: Colors.white),
                                iconEnabledColor: Colors.black,
                                items: <String>[
                                  'Private Bank',
                                  'Public Bank',
                                  'Private Money Lender',
                                  'Government Schemes',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: const Text(
                                  "Finance Type",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    _finance_type = value!;
                                  });
                                },
                              ),
                            ),
                            // SizedBox(height: size.height * 0.03),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Due Amount",
                                ),
                              ),
                            ),
                            // SizedBox(width: 10),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: const TextField(
                                decoration: InputDecoration(
                                  labelText: "Interest Rate",
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/navBar');
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                textColor: Colors.white,
                                padding: const EdgeInsets.all(0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  width: size.width * 0.7,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80.0),
                                      gradient: const LinearGradient(colors: [
                                        Color(0xFF222D65),
                                        Color(0xFF179BD7)
                                      ])),
                                  padding: const EdgeInsets.all(0),
                                  child: const Text(
                                    "Submit Details",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10),
                              child: GestureDetector(
                                onTap: () => {},
                                child: const Text(
                                  "*This Information will be used to provide financial analysis and forecasting",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2661FA)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
