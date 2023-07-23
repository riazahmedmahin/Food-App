import 'package:code/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final Config = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    Config.dispose();

  }

void SignUp() async {

    //-----
  showDialog(
      context: context,
      builder: (context){
        return Center(
          child: CircularProgressIndicator(),
        );
      }

  );


  //-----

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }

}

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  'Hello! Register to get start',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "User",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),

                        ),
                      ),
                    )),
              ),

              SizedBox(
                height: 15,
              ),

///////////////// email

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
                          hintText: "Email",

                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),

                        ),
                      ),
                    )),
              ),
 SizedBox( height: 10,),

///////////////// password

SizedBox(height: 10,),

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
                       controller: passwordController,

                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    )),
              ),

SizedBox(height: 14,),

////////////////  confrimpassword
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
                        controller: Config,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confrim Password",
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



              SizedBox(
                height: 20,
              ),
/////////////////////////// login button
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
                        onPressed: SignUp,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            'Register ',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ////////////////////////////////////// text devider

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    )),
                    Text(" or register in with "),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    )),
                  ],
                ),
              ),

              ///////////////// logo login

              const SizedBox(height: 55),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,

                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              'images/fb.png',
                              height: 32,
                            ))),
                    SizedBox(
                      width: 15,
                    ),

                    /////////
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              'images/apple.png',
                              height: 32,
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    //////////
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              'images/google.png',
                              height: 32,
                            ))),
                  ],
                ),
              ),

              SizedBox(
                height: 60,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Page()));
                    },
                    child: Text(
                      "login",

                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
