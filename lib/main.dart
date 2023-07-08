import 'package:chatapp/help/help_function.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:chatapp/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:chatapp/shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: Constants.apiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSigned = false;

  @override
  void initState() {
    super.initState();

    getUserStatus();
  }

  getUserStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) => {
          if (value != null)
            {
              setState(() {
                _isSigned = value;
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSigned ? const HomePage() : const LoginPage(),
    );
  }
}
