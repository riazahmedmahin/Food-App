import 'package:code/components/button.dart';
import 'package:code/pages/forget.dart';
import 'package:code/pages/regiater.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login_Page extends StatefulWidget {
   Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void SignIn()  async {

    showDialog(
        context: context,
        builder: (context){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

    );



    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email : emailController.text,
      password : passwordController.text,
    );
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

      ),


      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
        children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text('Welcome Back, Glad to you see again !',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 120,),




//-------------------------email------------------


        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F9),
                border: Border.all(
                  color: Colors.black,
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
                    label: Text("Email",style: TextStyle(color: Colors.black),),
                    //hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              )),
        ),

        SizedBox(height: 15,),

//------------------------password-----------------------------------
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F9),
                border: Border.all(
                  color:Colors.black,
                ),
                borderRadius: BorderRadius.circular(8),

              ),

              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    label: Text('Password',style: TextStyle(color: Colors.black),),
                    //hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.black,
                    ),
                  ),
                ),
              )),
        ),

        //////////// ////////////////text

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Forget()));
              },

              child: Text("Forget Password ?",style: TextStyle(color: Colors.black),),

            ),
          ),
        ),

        SizedBox(height: 40,),

/////////////////////////// login button
        Button(
          onTap: SignIn,
        ),
        SizedBox(height: 30,),

        ////////////////////////////////////// text devider

        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
          ),
          child: Row(
            children: [
              Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
              ),
              Text(" or login in with "),
              Expanded(
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
              ),

            ],
          ),
        ),

        ///////////////// logo login

        const SizedBox(height: 55),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(

                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: Image.asset('images/fb.png',
                        height: 32,)
                  )
              ),
              SizedBox(width: 15,),

              /////////
              Expanded(

                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: Image.asset('images/apple.png',
                        height: 32,)
                  )
              ),
              SizedBox(width: 10,),
              //////////
              Expanded(

                  child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)

                      ),

                      child: Image.asset('images/google.png',
                        height: 32,)
                  )
              ),

            ],
          ),
        ),

        SizedBox(height: 60,),



        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("don't have an account ? "),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              },
              child: Text("register",style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),


        ],
      ),

    ),
    )
    );
  }
}
