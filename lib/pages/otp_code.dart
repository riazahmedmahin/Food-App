import 'package:code/pages/create_password.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTP_Code extends StatelessWidget {
  const OTP_Code({super.key});

  @override
  Widget build(BuildContext context) {

    PinTheme defaultTheme = PinTheme(
      height: 75,
      width: 75,
      textStyle: const TextStyle(
        fontSize: 25,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(
          color: const Color(0xFFE8ECF4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
    PinTheme focusedTheme = PinTheme(
      height: 75,
      width: 75,
      textStyle: const TextStyle(
        fontSize: 25,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF35C2C1),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );


    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Text(
            'OTP Varification',


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
            "Enter the verification code we just sent on your email address.",


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
//------------------------------- OTP-------------------------
        Row(
          children: [
            Expanded(
                child: Center(child:
                Pinput(
    defaultPinTheme: defaultTheme,
    focusedPinTheme: focusedTheme,
    submittedPinTheme: focusedTheme,
    ))),
          ],
        ),

//----------------------------------button------------------------------------------
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreatePasswordScreen()));

                  },
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Verify ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
//---------------------- text-----------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("don't get code? "),
            GestureDetector(
              onTap: () {

              },
              child: Text(
                "Resend",

                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),

      ],
    )

  ),

    );

  }
}
