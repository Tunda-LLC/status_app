import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ranges from 0.0 to 1.0
Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

const APP_BLACK = Color(0xff040301);
const APP_PRIMARY = Color(0xff24A8CC);
const APP_ACCENT = Color(0xff010D39);
const Color LIGHT_BLUE = Color(0xff38DDFE);
const Color APP_GREEN = Color(0xff4AD393);
const Color APP_GREY = Color(0xff757575);
const Color REAL_WHITE = Color(0xffffffff);
const Color REAL_BLACK = Color(0xff000000);
const Color SCAFFOLD_BG = Color(0xfff9f9f9);
const Color SHIMMER_LIGHT = Color(0xffE4E6EB);
const Color SHIMMER_DARK = Color(0xffD8DADF);
const Color SHIMMER_BLUE_LIGHT = Color(0xff00F8FF);
const Color SHIMMER_BLUE_DARK = Color(0xff005B92);
const Color APP_RED = Color(0xffD83A43);
const Color APP_GOLD = Color(0xffFEBE01);
const Color APP_DARK = Color(0xff020A18);

const TextStyle normalTextStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: APP_BLACK);

const TextStyle titleTextStyle =
    TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: APP_BLACK);

navigatePage(context, {required Widget className}) {
  return Navigator.of(context)
      .push(CupertinoPageRoute(builder: (context) => className));
}

Container normalButton(
    {required double v16, required Color bgColor, required String title}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: v16, horizontal: v16 * 2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: bgColor,
    ),
    child: Center(
        child: Text(
      title,
      style: normalTextStyle.copyWith(color: REAL_WHITE),
    )),
  );
}

const testImage =
    'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

const faceImage =
    "https://images.pexels.com/photos/1882309/pexels-photo-1882309.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const flagImage = 'https://cdn.countryflags.com/thumbs/uganda/flag-400.png';

const testImage1 =
    "https://images.pexels.com/photos/1440727/pexels-photo-1440727.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage2 =
    "https://images.pexels.com/photos/7745561/pexels-photo-7745561.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage3 =
    "https://images.pexels.com/photos/850360/pexels-photo-850360.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testImage4 =
    "https://images.pexels.com/photos/1042143/pexels-photo-1042143.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";

const testToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5M2FjNjM0Ni1kYjk2LTQ2YmEtODcxMS1iOWViMjkxOWU1NmIiLCJqdGkiOiJjZTQ1NjE4ZGVhMjU0MzVjOWY3OWIzYmNmMThhNWY2OTQyNTk3MjE1OGU0YjA1YjBiMjgxNDc4MzJlZjFkNjY3YTkwODdiODAxMjRkZWI3YSIsImlhdCI6MTYyMzk5NjY4NiwibmJmIjoxNjIzOTk2Njg2LCJleHAiOjE2NTU1MzI2ODYsInN1YiI6ImMzNDI2NzhhLTZlNmMtNDVjNy04NDk4LTlmYzFiYWNjODZkMyIsInNjb3BlcyI6W119.lkyboRL-_L9bMFirSSm0LkQK1lMIi9m_1njwqF9qzw0hu3g_Ci1c-yu9lPiJ0eUEns1oY4M4BJnPt7mA-hK4xeTGI6aV554fIN7-tVlfMnvcs0zM_cyEFfBlrLyWWTdqsnR3ea5ldC2aLRIKTrGOLS8oFfoX5Hv2qN7qG_mRjYlor_sokW6XEM0G_hRmZsTN-MIsHuplEOyp6jLgohYfMlTXygqoOrO5E-czW46VCRFWHa0r3j6epv3wo3q6urmtJ4Ehjz6mAjvhcNHd7bLCuugGch0DEmyklTzcH39-LB6YGSZVwvsAuCeX1OcpqZi8AhwG0dKYq7F2Gd8t22fi7vVUFSAno3rojYubZGsH1bpNlmTNejvU_f-8pM54FvAP41WvS6lLvriglhdfzUhbKMGMV3ABBFCZTTVbGkHg61lyo_DyCrQpN7HK33QkawZUbnCGzI9OC9ECxHLe3h8MKk9ZT_86Fdd7WLc1IvzV5eoThLTn5Zb5OgmHp6kc5wg5qy8s3MgECDA8xYm4ptxSgitOgSWxLu4Lc53lZ2mZ5XbffLphnFD1yXpllyKKgP1dZpHMggKlV2RyWytK53DXef2CKBgIfzbtVtppQz8H8WAPPeeZpAUayp1tRRgy7D-c07u5V2yCKNrW7617n7rrLJ5_Zfm9B5kkLZoiE26R6so";
