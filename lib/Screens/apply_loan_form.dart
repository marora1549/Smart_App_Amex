import 'package:flutter/material.dart';

class ApplyLoanForm extends StatefulWidget {
  const ApplyLoanForm({Key? key}) : super(key: key);

  @override
  State<ApplyLoanForm> createState() => _ApplyLoanFormState();
}

class _ApplyLoanFormState extends State<ApplyLoanForm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _years = '0 years';
    String _months = '0 months';
    String _status = 'Full-Time';

    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      appBar: AppBar(
        toolbarHeight: 70,
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
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Loan Application',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'FreeScale Posters',
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
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: ListView(
            children: [
              // SizedBox(height: size.height * 0.05),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: size.height * 0.8,
                    width: size.width * 0.9,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: <Widget>[
                          const SizedBox(height: 30),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: const TextField(
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const TextField(
                              decoration: InputDecoration(
                                labelText: "Amount of Loan",
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const TextField(
                              decoration:
                                  InputDecoration(labelText: "Mobile Number"),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const TextField(
                              decoration: InputDecoration(
                                  labelText: "ID Number",
                                  hintText: "e.g. SSN, PAN"),
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Text(
                              'Time Period',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF222D65),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DropdownButton<String>(
                                  focusColor: Colors.white,
                                  value: _years,
                                  //elevation: 5,
                                  style: const TextStyle(color: Colors.white),
                                  iconEnabledColor: Colors.black,
                                  items: <String>[
                                    '0 years',
                                    '1 years',
                                    '2 years',
                                    '3 years',
                                    '4 years',
                                    '5 years',
                                    '6 years',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Text(
                                    "Years",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _years = value!;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                DropdownButton<String>(
                                  focusColor: Colors.white,
                                  value: _months,
                                  //elevation: 5,
                                  style: const TextStyle(color: Colors.white),
                                  iconEnabledColor: Colors.black,
                                  items: <String>[
                                    '0 months',
                                    '1 months',
                                    '2 months',
                                    '3 months',
                                    '4 months',
                                    '5 months',
                                    '6 months',
                                    '7 months',
                                    '8 months',
                                    '9 months',
                                    '10 months',
                                    '11 months',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.black),
                                      ),
                                    );
                                  }).toList(),
                                  hint: const Text(
                                    "Ethnicity",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      _months = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: DropdownButton<String>(
                              focusColor: Colors.black,
                              value: _status,
                              //elevation: 5,
                              style: const TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.black,
                              items: <String>[
                                'Full-Time',
                                'Part-Time',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: const Text(
                                "Business Status",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _status = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.05),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/businessDetails');
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
                                  "Apply for loan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
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
                                "*This Information will be used to notify you about suitable government grants",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2661FA)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
