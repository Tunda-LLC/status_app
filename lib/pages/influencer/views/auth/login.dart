import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:status/common/colors.dart';
import 'package:status/pages/influencer/views/auth/google_signin.dart';
import 'package:status/pages/influencer/views/auth/register.dart';
import '../toast.dart';
import 'forgot_password.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscure = true;
  TextEditingController _pswdController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  // bool _verified = false;
  var _box, _tokenBox;
  bool _loading = false, _loading2 = false;
  @override
  void initState() {
    super.initState();
    // HIVE BOX
    // _box = Hive.box(UserRegBox);
    // _tokenBox = Hive.box(TokenBox);
  }

  _googleSignIn() async {
    setState(() {
      _loading2 = true;
    });
    try {
      UserCredential _userCredential = await signInWithGoogle();
    } catch (e) {
      // print('########### GSIGN: ${e.toString()} ##############');
      showErrorToast(
          "Problem signing in with Google, check your connection", context);
      setState(() {
        _loading2 = false;
      });
      return;
    }
    //todo go ahead check if account exists then show him so he can be a seller
    User user = FirebaseAuth.instance.currentUser!;
    // var result = await userLogIn(email: user.email);
    // if (result.runtimeType == user_model.User) {
    //   _tokenBox.put("id", result.id); //put the id here
    //   _tokenBox.put("default_currency", result.currency);
    //   _tokenBox.put("country_name", result.country_name);
    //   _tokenBox.put("country_id", result.country_id);
    //   showSuccessToast("You are logged In", context);
    // Navigator.push(
    //     context, CupertinoPageRoute(builder: (context) => Index()));
    // } else {
    //   // if (result.contains('404')) {
    //   // new user
    //   setState(() {
    //     _loading = false;
    //   });
    //   _box.put('name', user.displayName);
    //   _box.put('email', user.email);
    //   // Navigator.push(context,
    //   //     CupertinoPageRoute(builder: (context) => LocationSelectCountry()));
    //   // }
    // }
  }

  _signIn() async {
    setState(() {
      _loading = true;
    });
    // String cow = await retrieveToken();
    // print(cow);
    String _eml = _emailController.text.trim();
    String _pswd = _pswdController.text.trim();
    if (!_eml.contains('@')) {
      showErrorToast("Enter a valid email", context);
      setState(() {
        _loading = false;
      });
      return;
    }
    FocusScope.of(context).unfocus();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _eml, password: _pswd);

      User user = userCredential.user!;
      // User user = FirebaseAuth.instance.currentUser;
      bool _verified = await _verify(user);
      if (_verified) {
        // var result = await userLogIn(email: user.email);
        // if (result.runtimeType == user_model.User) {
        //   _tokenBox.put("id", result.id); //put the id here
        //   _tokenBox.put("default_currency", result.currency);
        //   _tokenBox.put("country_name", result.country_name);
        //   _tokenBox.put("country_id", result.country_id);

        //   showSuccessToast("You are logged In", context);
        //   Navigator.push(
        //       context, CupertinoPageRoute(builder: (context) => Index()));
        // } else {
        //   // print(result.runtimeType.toString());
        //   showErrorToast("Problem logging in, check your connection", context);
        //   setState(() {
        //     _loading = false;
        //   });
        //   return;
        // }
      } else {
        // go to your email and come back
        // leave this empty
      }
    } on FirebaseAuthException catch (e) {
      // print(e.toString());
      if (e.code == 'user-not-found') {
        showErrorToast("User not found for that email", context);
        setState(() {
          _loading = false;
        });
        return;
      } else if (e.code == 'wrong-password') {
        showErrorToast("Wrong password for that email", context);
        setState(() {
          _loading = false;
        });
        return;
      }
    }
  }

  _verify(User user) async {
    user.reload();
    if (user.emailVerified) {
      return true;
    }
    try {
      await user.sendEmailVerification();
      showToast("Check your email to verify", context);
      return false;
    } catch (e) {
      showErrorToast("Error verifying email", context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double v16 = width / 20;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: REAL_WHITE,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: APP_ACCENT,
          ),
        ),
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Login",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: ListView(
          padding: EdgeInsets.all(v16),
          children: [
            Container(
              child: Text("Email", style: normalTextStyle),
            ),
            Container(
              child: TextField(
                controller: _emailController,
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    focusColor: APP_PRIMARY,
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      gapPadding: 2,
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: v16),
              child: Text("Password", style: normalTextStyle),
            ),
            Container(
              child: TextField(
                autofocus: false,
                controller: _pswdController,
                obscureText: _obscure,
                decoration: InputDecoration(
                  focusColor: APP_PRIMARY,
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    gapPadding: 2,
                    borderSide: BorderSide(width: 2),
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 8),
                      child: _obscure
                          ? Icon(
                              Icons.visibility,
                              // size: 22,
                              // color: DARK_GREY,
                            )
                          : Icon(
                              Icons.visibility_off,
                              // size: 22,
                              // color: DARK_GREY,
                            ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ForgotPassword())),
              child: Container(
                padding: EdgeInsets.only(top: v16),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: normalTextStyle.copyWith(color: APP_PRIMARY),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _loading ? null : _signIn(),
              child: Container(
                margin: EdgeInsets.only(top: v16),
                child: normalButton(
                  v16: v16,
                  title: _loading ? "loading..." : "Log In",
                  bgColor: _loading ? APP_GREY : APP_ACCENT,
                  // callback: null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: v16 * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    width: v16 * 4,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: v16),
                    child: Text("or log in with", style: normalTextStyle),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    width: v16 * 4,
                    height: 1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: v16 * 2),
              child: GestureDetector(
                onTap: () => _loading2 ? null : _googleSignIn(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: v16, vertical: v16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    // color: darken(Colors.white, 0.08),
                    color: _loading2 ? APP_GREY : Color(0xffDD4B39),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          color: REAL_WHITE,
                          width: v16 * 1.5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(_loading2 ? "loading..." : "Google",
                              style:
                                  normalTextStyle.copyWith(color: REAL_WHITE)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Container(
            //   margin: EdgeInsets.only(top: v16 * 2),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(top: 3),
            //         width: v16 * 2,
            //         height: 1,
            //         decoration: BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: BorderRadius.circular(2)),
            //       ),
            //       Container(
            //         padding: EdgeInsets.symmetric(horizontal: v16),
            //         child:
            //             Text("Don't have an Account?", style: normalTextStyle),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(top: 3),
            //         width: v16 * 2,
            //         height: 1,
            //         decoration: BoxDecoration(
            //             color: Colors.black,
            //             borderRadius: BorderRadius.circular(2)),
            //       ),
            //     ],
            //   ),
            // ),

            // GestureDetector(
            //   onTap: () => Navigator.push(context,
            //       CupertinoPageRoute(builder: (context) => Register())),
            //   child: Container(
            //     margin: EdgeInsets.only(top: v16),
            //     child: normalButton(
            //       v16: v16,
            //       title: "Create Account",
            //       bgColor: APP_GREEN,
            //       // callback: null,
            //     ),
            //   ),
            // ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Register())),
              child: Container(
                margin: EdgeInsets.only(top: v16 * 2),
                child: Center(
                  child: Text("Don't have an Account?",
                      style: normalTextStyle.copyWith(
                        color: APP_GREY,
                        decoration: TextDecoration.underline,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
