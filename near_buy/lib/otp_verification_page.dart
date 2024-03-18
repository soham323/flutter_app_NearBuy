import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:near_buy/main.dart';
import 'package:near_buy/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:near_buy/VerificationSuccessful.dart';
class OTPVerificationPage extends StatelessWidget {
  final String email;
  OTPVerificationPage({required this.email});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Near Buy Logo.png',
                height: 150,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(
                  fontSize: 35,
                  // height: 5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height:50,
                child: Text(
                  "Enter the OTP sent to your " + email,
                  style: TextStyle(fontSize: 15, color: Color.fromRGBO(6, 16, 253, 1)),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                  width: 400, // Set the width of the TextField here
                  height: 50,
                  child: OTPTextField()), // Custom OTP text field widget
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 237,
                height: 48, // Set the width of the button here
                child: ElevatedButton(
                  onPressed: () {
                    print('Email:- $email');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => VerificationSuccessScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(
                          214, 228, 50, 1), // Replace with your RGBA values
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Adjust the circular radius here
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity,
                          50), // Adjust the height of the button here
                    ),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height:30,
                child: Text(
                  'Did not Receive an OTP?  Resend',
                  style: TextStyle(fontSize: 20, color: Color.fromRGBO(6, 16, 253, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPTextField extends StatefulWidget {
  @override
  _OTPTextFieldState createState() => _OTPTextFieldState();
}

class _OTPTextFieldState extends State<OTPTextField> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // Set the width of the TextField here
      height: 50, // Set the height of the TextField here
      child: TextField(
        controller: otpController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Enter OTP',
          filled: true,
          fillColor: Colors.grey[200], // Adjust the background color as needed
        ),
      ),
    );
  }
}

