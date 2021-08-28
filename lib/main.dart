import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth/register.dart';
import 'common/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hive_flutter/hive_flutter.dart';
import 'common/loading_splash.dart';
import 'intro/intro.dart';
import 'intro/intro_index.dart';
import 'pages/index.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;

const UserBox = 'userBox';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox(UserBox);
  var box = Hive.box(UserBox);
  runApp(MyApp(
      status: box.get("signedIn") ?? false,
      verify: box.get("verifyPage") ?? false));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late bool status, verify;
  MyApp({required this.status, required this.verify});

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

      home: status
          ? Index()
          : verify
              ? Register(verify: true)
              : IntroIndex(),
      // home: Index(),
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

//todo
Future<String> retrieveToken() async {
  var box = Hive.box(UserBox);
  return "Bearer ${box.get("token")}";
  // return "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5M2FjNjM0Ni1kYjk2LTQ2YmEtODcxMS1iOWViMjkxOWU1NmIiLCJqdGkiOiI2NTg4ZWYwM2E3MThkMWNiYjc5YTI0ZmNlYmI4YmQ3ODY2ODc0MDZmMzM2ODM4MTk4NDcwYmRmZTU4ZmZlZWQzYjFmMWQxMjI0Y2U0NTQ5MSIsImlhdCI6MTYzMDA3NjA4MSwibmJmIjoxNjMwMDc2MDgxLCJleHAiOjE2NjE2MTIwODEsInN1YiI6ImJjNjk2MTQ4LWU4YjktNGVkYy05YjNjLTYyOGE3OGY3OTdlMyIsInNjb3BlcyI6W119.HU_mvVQ_SbEsQYEjfflLQfwGkg1OCgVJ5_hb84Kn5oexVbrFbpcmFHak9fsrrngirVp9xzdNbGRGujL4I3Wmp5LstqwURC8l6tIWPNxR7Q9Va2CsDQJa_dekPf8ST0_jiaeDZ7CrGGxatIB0KqiKQLMWWpOzlGaiR2Kk2PQ0fqETQG-46ICpfoxn2DnhVrQqdONqcs6sRQv9cDjIYPFZ2Rphb_PMx66GZN6CPXFJEUCJZYTtgGFcArZvxbACgrhCL2Me-fltYiyDZa33ZdZ0f-JoF_SVtFkRbE24j_s3IN5zGqGg1Nh8qODTxYBukP7f18_HqGPCN_Z_SpTdcQ039G_fpOxgpFHDQtZMRl_qQWX7uAelPBuZp2RKwI1viiaFGJ60F1we-sjVBt7G3yWvGkpwyYeRlGbJ1Gzo32JYSc7dIYaeXBNNmsyjffWV1y86dAXERM2M52pPXr7vnTtiveOs6YyTpoULL6-4IXh1JTpjGqF9SR32w5wLA-4Ok-Tza0Ejz7ppXe6LW6jyx6N2RZtd7I8s75JJ0JGUrdMgnehoVwPrIqD6f4o5fLfYSU8jJ9lxlonDgcxFNE4v-vLPpOax0cVlU7ANjtsNziJvlZpfD4hdj1vNi-oMwjPZ0Qx6BWujpjXuq7FYJVoiVWWRY-m0UuWJdF0ydC9J01h5jhQ";
}

saveToken(String token, String id) {
  // print(token);
  var box = Hive.box(UserBox);
  box.put("token", token);
  box.put("signedIn", true);
  box.put("id", id);
}

logOut(context) async {
  var box = Hive.box(UserBox);
  box.clear();

  // sign out
  await fAuth.FirebaseAuth.instance.signOut();
  // google sign out
  GoogleSignIn googleSignIn = new GoogleSignIn();
  await googleSignIn.signOut();

  Navigator.push(
      context, CupertinoPageRoute(builder: (context) => IntroIndex()));
}
