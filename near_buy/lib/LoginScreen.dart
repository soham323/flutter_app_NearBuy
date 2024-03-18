import 'package:flutter/material.dart';
import 'package:near_buy/otp_verification_page.dart';
import 'package:email_auth/email_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final EmailAuth emailAuth = EmailAuth(sessionName: "send OTP");
  bool isOTPsent = false;
  void sendOTP(String emailAddress) async{
    bool result = await emailAuth.sendOtp(recipientMail: emailAddress, otpLength: 4);
    setState(() {
      isOTPsent = result;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NearBuy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80),
              Text(
                'Log In',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40, width: 40,),
              Image.asset('assets/images/Near Buy Logo.png'),

              SizedBox(height: 40),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  sendOTP(emailController.text);
                  // TODO: Implement send OTP function
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPVerificationPage(email: email)));
                },
                child: Text('Send OTP'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'By logging in, you agree to our Terms of Use and acknowledge that you read our Privacy Policy',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement retail seller function
                },
                child: Text('You\'re a Retail seller?'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
