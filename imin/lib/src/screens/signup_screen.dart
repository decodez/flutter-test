import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


class SignupScreen extends StatelessWidget {
  String phoneNo;
  String smsCode;
  String verificationId;

  

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
      print('verified');
    };

    final PhoneVerificationFailed verifiFailed = (AuthException exception) {
      print('${exception.message}');
    };


    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: this.phoneNo,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifiFailed
    );

    Future<bool> smsCodeDialog(BuildContext context) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter OTP'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              FlatButton(
                child: Text('Done'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user){
                    if(user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    }
                    else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                }
              ),
            ],
          );
        }
        
      );
      signIn() {
        FirebaseAuth.instance
          .signInWithPhoneNumber(
            verificationId: verificationId,
            smsCode: smsCode,
          ).then((user){
            Navigator.of(context).pushReplacementNamed('/homepage');
          })
        .catchError((e) {

        });
    }
    }
   
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Enter Phone Number'),
                onChanged: (value) {
                  this.phoneNo = value;
                },
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                onPressed: verifyPhone,
                child: Text('Verify'),
                textColor: Colors.white,
                elevation: 7.0,
                color: Colors.blue,
              )
            ],
          ),
        ),
      )
    );
  }
}