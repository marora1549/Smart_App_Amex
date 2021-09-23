import 'package:smart_app/constants.dart';
import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  final Widget child;

  const AppContent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border(
              right: BorderSide(
                color: Colors.white,
                width: 135,
              ),
            ),
          ),
        ),
        this.child,
      ],
    );
  }
}
