import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:status/home.dart';
import 'package:status/loading_splash.dart';
import 'package:status/pages/index.dart';
import 'package:status/verify_apply.dart';
import 'common/colors.dart';
import 'package:firebase_core/firebase_core.dart';

import 'apply_page.dart';
import 'pages/intro_index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();  error screen with try again button
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return LoadingSplash();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Tunda Status',
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
          fontFamily: "ProximaNova",
          primaryColor: APP_ACCENT,
          scaffoldBackgroundColor: SCAFFOLD_BG),
      home: IntroIndex(),
      // home: VerifyApplyPage(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
