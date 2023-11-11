/*import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utils/utils.dart';
import '../../screens/home_screen.dart';
import '../../widgets/round_button.dart';

class VerificationScreen extends StatefulWidget {
  final String emailController;
  const VerificationScreen({Key? key,required this.emailController}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  final otpcontroller = TextEditingController();
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
  void verify(){
    bool ver =
    emailAuth.validateOtp(
        recipientMail:widget.emailController,
        userOtp: otpcontroller.value.text);

    if(ver){
       _auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      ).then((value) {
        setState(() {
          loading = false;
        });
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Enter the otp"),
          SizedBox(height: 30,),
          TextFormField(
            controller: otpcontroller,
            decoration: InputDecoration(
              hintText: "OTP",
              prefixIcon: Icon(Icons.verified),
            ),
          ),
          SizedBox(height: 50,),
          RoundButton(
            loading: loading,
              title: "Verify",
              onTap: (){

                }

          ),
        ],
      ),
    );
  }
}
*/