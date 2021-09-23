import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:smart_app/Services/size_config.dart';
import '../Services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const users = {
  'mohan@gmail.com': '123456',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // AuthService auth = AuthService();

  // @override
  // void initState() {
  //   super.initState();
  //   if (auth.user != null) {
  //     Navigator.pushReplacementNamed(context, '/navBar');
  //   }
  // }

  Duration get loginTime => Duration(milliseconds: 2250);

  // Future<String> _createUser(LoginData data) async {
  //   print('Email: ${data.name}, Password: ${data.password}');
  //   dynamic result =
  //       await auth.registerWithEmailAndPassword(data.name, data.password);
  //   if (result == null) {
  //     return 'User could not be created';
  //   }
  //   return 'null';
  // }

  // Future<String> _authUser(LoginData data) async {
  //   print('Name: ${data.name}, Password: ${data.password}');
  //   dynamic result =
  //       await auth.signInWithEmailAndPassword(data.name, data.password);
  //   if (result == null) {
  //     return "User doesn't exist";
  //   }
  //   return 'null';
  // }

  Future<String?> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );
    return FlutterLogin(
      // title: 'SMART',
      logo: 'assets/images/logo_with_title.png',
      onLogin: _authUser,
      onSignup: _authUser,
      theme: LoginTheme(
        primaryColor: Colors.white,
        accentColor: Colors.white,
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.blue.shade100,
        ),
        inputTheme: const InputDecorationTheme(
          filled: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff192841), width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff192841), width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: const LoginButtonTheme(
          splashColor: Colors.red,
          backgroundColor: Color(0xff192841),
          highlightColor: Colors.grey,
          elevation: 9.0,
          highlightElevation: 6.0,
        ),
        authButtonPadding: EdgeInsets.all(10.0),
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            // var user = await auth.googleSignIn();
            // if (user != null) {
            //   Navigator.pushReplacementNamed(context, '/navBar');
            // }
            print('start google sign in');
            await Future.delayed(loginTime);
            print('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            print('start facebook sign in');
            await Future.delayed(loginTime);
            print('stop facebook sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacementNamed(context, '/personalDetails');
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
