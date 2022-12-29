import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_sqflite/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      // style: primaryTextStyle.copyWith(
                      //   fontSize: 24,
                      //   fontWeight: semiBold,
                      // ),
                      style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    // DView.spaceHeight(2),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Let\'s get started',
                      // style: subtitleTextStyle,
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    )
                  ],
                ),
                Spacer(),
                Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                )
              ],
            )
          ],
        ),
      );
    }

    Widget input(String title, String hint, bool isPassword,
        TextEditingController controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              /*  style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ), */
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            // DView.spaceHeight(12),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                  // color: bgColor2,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1.1)),
              child: Center(
                child: Row(
                  children: [
                    // Image.asset(
                    //   icon,
                    //   width: 17,
                    // ),
                    // DView.spaceWidth(16),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        obscureText: isPassword,
                        // style: primaryTextStyle.copyWith(
                        //   fontSize: 14,
                        // ),

                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                        decoration: InputDecoration.collapsed(
                          hintText: hint,
                          // hintStyle: subtitleTextStyle,
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget button() {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          // color: biruBarca,
          color: Color(0xff064663),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
          // border rad
          child: Text(
            'Sign Up',
            // style: primaryTextStyle.copyWith(
            //   fontSize: 16,
            //   fontWeight: medium,
            // ),
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account? ',
              // style: subtitleTextStyle,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              child: Text(
                'Sign In',
                // style: purpleTextStyle.copyWith(
                //   fontWeight: medium,
                //   color: biruBarca,
                // ),
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber,
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff041C32),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            // horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              // DView.spaceHeight(70),
              SizedBox(
                height: 70,
              ),
              input(
                'Username',
                'Your Username',
                false,
                usernameController,
              ),
              // DView.spaceHeight(20),
              SizedBox(
                height: 20,
              ),
              input(
                'Email Address',
                'Your Email Address',
                false,
                emailController,
              ),
              SizedBox(
                height: 20,
              ),
              input(
                'Password',
                'Your Password',
                true,
                passwordController,
              ),
              // DView.spaceHeight(30),
              SizedBox(
                height: 30,
              ),
              button(),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
