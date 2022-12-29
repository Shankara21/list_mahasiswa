import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_sqflite/list_mahasiswa.dart';
import 'package:uas_sqflite/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    String emailCheck = 'admin@gmail.com';
    String passwordCheck = '123';

    void validateLogin(String email, String password) {
      print('email : $email');
      print('password : $password');
      if (email == emailCheck && password == passwordCheck) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListMahasiswa(),
          ),
        );
      } else {
        // Menampilkan error dengan snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
            content: Text('Email atau password salah'),
          ),
        );
      }
    }

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
                      'Login',
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
                      'Sign In to Countinue',
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
                        obscureText: isPassword,
                        // style: primaryTextStyle.copyWith(
                        //   fontSize: 14,
                        // ),
                        controller: controller,
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
            validateLogin(emailController.text, passwordController.text);
          },
          // border rad
          child: Text(
            'Sign in',
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
              'Don\'t have an account? ',
              // style: subtitleTextStyle,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              ),
              child: Text(
                'Sign Up',
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
                'Email Address',
                'Your Email Address',
                false,
                emailController,
              ),
              // DView.spaceHeight(20),
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
              // button(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: biruBarca,
                  color: Color(0xff064663),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton(
                  onPressed: () {
                    validateLogin(
                        emailController.text, passwordController.text);
                  },
                  // border rad
                  child: Text(
                    'Sign in',
                    // style: primaryTextStyle.copyWith(
                    //   fontSize: 16,
                    //   fontWeight: medium,
                    // ),
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
