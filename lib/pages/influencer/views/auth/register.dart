import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status/common/colors.dart';
import '../toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  bool verify;
  Register({this.verify = false});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscure = true, _obscure2 = true;
  TextEditingController _pswdController = TextEditingController();
  TextEditingController _confirmPswdController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  late PageController _pageController;
  // HIVE BOX
  // var box = Hive.box(UserRegBox);
  int _verifyPage = 1;
  late bool _verified;
  bool _isLoading = false, _isLoading2 = false;

  @override
  void initState() {
    super.initState();
    _verified = widget.verify;
    if (_verified) {
      _pageController = PageController(initialPage: _verifyPage);
    } else {
      _pageController = PageController(initialPage: 0);
    }
  }

  _registerUser() async {
    setState(() {
      _isLoading = true;
    });
    String _pswd = _pswdController.text.trim();
    String _pswd2 = _confirmPswdController.text.trim();
    String _eml = _emailController.text.trim();
    String _username = _usernameController.text.trim();
    FocusScope.of(context).unfocus();

    if (_username.length < 4) {
      showErrorToast("Username should be greater than 4 characters", context);
      setState(() {
        _isLoading = false;
      });
      return;
    }
    if (_pswd != _pswd2) {
      showErrorToast("Passwords don't match", context);
      setState(() {
        _isLoading = false;
      });
      return;
    }

    if (_pswd.length < 7) {
      showErrorToast("Password should be atleast 8 characters", context);
      setState(() {
        _isLoading = false;
      });
      return;
    }

    if (!_eml.contains('@')) {
      showErrorToast("Enter a valid email", context);
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _eml, password: _pswd);
      // User user = FirebaseAuth.instance.currentUser!;
      // user.updateProfile(displayName: _username);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showErrorToast("The password provided is too weak", context);
        setState(() {
          _isLoading = false;
        });
        return;
      } else if (e.code == 'email-already-in-use') {
        showErrorToast("The account already exists for that email", context);
        setState(() {
          _isLoading = false;
        });
        return;
      }
    } catch (e) {
      // print(e);
      showErrorToast(
          "Problem creating account, check your connection", context);
      setState(() {
        _isLoading = false;
      });
      return;
    }

    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        // print('User is currently signed out!');
        // return;
      } else {
        // print('User is signed in!');
        // box.put('name', _username);
        // box.put('email', user.email);
        if (!user.emailVerified) {
          await user.sendEmailVerification();
          // box.put("verifyPage", true);
          _pageController.animateToPage(
            _verifyPage,
            duration: Duration(milliseconds: 400),
            curve: Curves.bounceInOut,
          );
        } else {
          showToast("Please login instead", context);
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }
    });
  }

  resendLink() async {
    User user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    showToast("Link sent again, check your email", context);
    return;
  }

  checkVerified() async {
    setState(() {
      _isLoading2 = true;
    });
    User user = FirebaseAuth.instance.currentUser!;
    user.reload();

    if (user.emailVerified) {
      showSuccessToast("Email Verified", context);
      // Navigator.push(context,
      //     CupertinoPageRoute(builder: (context) => LocationSelectCountry()));
    } else {
      showErrorToast(
          "Please check your email to verify or double tap", context);
      setState(() {
        _isLoading2 = false;
      });
      return;
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
          // onTap: () => _verified
          //     ? Navigator.push(context,
          //         CupertinoPageRoute(builder: (context) => IntroPage()))
          //     : Navigator.pop(context),
          child: _verified
              ? Icon(
                  Icons.home_filled,
                  color: APP_ACCENT,
                )
              : Icon(
                  Icons.arrow_back_ios,
                  color: APP_ACCENT,
                ),
        ),
        centerTitle: true,
        elevation: 2,
        title: Text(
          "Create Account",
          style: TextStyle(color: APP_ACCENT, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            ListView(
              padding: EdgeInsets.all(v16),
              children: [
                Container(
                  child: Text(
                    "Username",
                    style: normalTextStyle,
                  ),
                ),
                Container(
                  child: TextField(
                    controller: _usernameController,
                    autofocus: false,
                    decoration: InputDecoration(
                        focusColor: APP_PRIMARY,
                        prefixIcon: Icon(Icons.account_circle_outlined),
                        border: OutlineInputBorder(
                          gapPadding: 2,
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: v16),
                  child: Text(
                    "Email",
                    style: normalTextStyle,
                  ),
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
                  child: Text(
                    "Password",
                    style: normalTextStyle,
                  ),
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
                Container(
                  padding: EdgeInsets.only(top: v16),
                  child: Text(
                    "Confirm Password",
                    style: normalTextStyle,
                  ),
                ),
                Container(
                  child: TextField(
                    autofocus: false,
                    controller: _confirmPswdController,
                    obscureText: _obscure2,
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
                            _obscure2 = !_obscure2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: _obscure2
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
                  onTap: () => _isLoading ? null : _registerUser(),
                  child: Container(
                    margin: EdgeInsets.only(top: v16),
                    child: normalButton(
                      v16: v16,
                      title: "Register",
                      bgColor: _isLoading ? APP_GREY : APP_ACCENT,
                      // callback: null,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ListView(
                padding: EdgeInsets.only(top: v16 * 2, left: v16, right: v16),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: v16 * 1.5),
                    child: Text(
                      "Check your email for the verification link",
                      style: titleTextStyle,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => resendLink(),
                    child: Container(
                      margin: EdgeInsets.only(top: v16),
                      child: normalButton(
                        v16: v16,
                        title: "Resend link",
                        bgColor: APP_PRIMARY,
                        // callback: null,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: v16,
                  ),
                  GestureDetector(
                    onTap: () => checkVerified(),
                    child: Container(
                      margin: EdgeInsets.only(top: v16),
                      child: normalButton(
                        v16: v16,
                        title: "Verified",
                        bgColor: _isLoading2 ? APP_GREY : APP_ACCENT,
                        // callback: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
