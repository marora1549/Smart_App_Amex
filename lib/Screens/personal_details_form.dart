import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String _gender = 'Male';
    String _ethnicity = 'Asian';
    String _status = 'Full-Time';

    return Scaffold(
      backgroundColor: const Color(0xFFFBF8FF),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
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
              ListView(
                children: [
                  SizedBox(height: size.height * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Step1: Add Your Personal Details',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF222D65),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.8,
                        width: size.width * 0.9,
                        child: Card(
                          elevation: 10.0,
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    labelText: "Address",
                                  ),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      labelText: "Mobile Number"),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      labelText: "ID Number",
                                      hintText: "e.g. SSN, PAN"),
                                ),
                              ),
                              SizedBox(height: size.height * 0.03),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownButton<String>(
                                      focusColor: Colors.white,
                                      value: _gender,
                                      //elevation: 5,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      iconEnabledColor: Colors.black,
                                      items: <String>[
                                        'Male',
                                        'Female',
                                        'Other',
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
                                        "Gender",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          _gender = value!;
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 10),
                                    DropdownButton<String>(
                                      focusColor: Colors.white,
                                      value: _ethnicity,
                                      //elevation: 5,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      iconEnabledColor: Colors.black,
                                      items: <String>[
                                        'Asian',
                                        'African American',
                                        'Hispanic',
                                        'Pacific Islander',
                                        'White',
                                        'Alaska Native'
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
                                          _ethnicity = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      borderRadius:
                                          BorderRadius.circular(80.0)),
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    width: size.width * 0.7,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.0),
                                        gradient: const LinearGradient(colors: [
                                          Color(0xFF222D65),
                                          Color(0xFF179BD7)
                                        ])),
                                    padding: const EdgeInsets.all(0),
                                    child: const Text(
                                      "Submit Details",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
