import 'package:code/pages/otp_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {


  final emailController = TextEditingController();
// ---------pass reset-----
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  Future passrest() async {
   try{

     await FirebaseAuth.instance.sendPasswordResetEmail(
         email: emailController.text.trim());
     showDialog(context: context, builder: (context){
       return AlertDialog(
         content: Text("check email"),
       );
     });

   }
   on FirebaseAuthException catch (e){
     print(e);
     showDialog(context: context, builder: (context){
       return AlertDialog(
         content: Text(e.message.toString()),
       );
     });
   }
  }
//-------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(

          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Text(
              'Forget Password?',


              style: TextStyle(

                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),

            ),

          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",


              style: TextStyle(

                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),

            ),

          ),

          SizedBox(
            height: 40,
          ),
          ///////Email
          SizedBox(
            height: 40,
          ),

////////////////  user

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF7F8F9),
                  border: Border.all(
                    color: Color(0xFFE8ECF4),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                )),
          ),

              SizedBox(height: 40,),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: passrest,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Send code ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


        ]
        ),
      )),
    );
  }
}
