import 'package:coffee_shop_app/Utils/utils.dart';
import 'package:coffee_shop_app/auth/screens/login_screen.dart';
import 'package:coffee_shop_app/auth/screens/verification_screen.dart';
import 'package:coffee_shop_app/screens/home_screen.dart';
import 'package:coffee_shop_app/widgets/round_button.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
   bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void SignUp(){
    if(_formKey.currentState!.validate()){
      setState(() {
        loading = true;
      });
     // sendOtp();
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
    }
  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: emailController.value.text, otpLength: 5
    );
    if (result) {
      // using a void function because i am using a
      // stateful widget and seting the state from here.

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.alternate_email),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter Password";
                        }
                        return null;
                      },
                    ),

                  ],
                )
            ),
            SizedBox(height: 50,),
            RoundButton(
                title: "SignUp",
                loading: loading,
                onTap: (){
                 SignUp();
                }
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ? "),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text("Login"),
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}
