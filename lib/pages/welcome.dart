import 'package:code/pages/auth_page.dart';
import 'package:code/pages/login.dart';
import 'package:code/main.dart';
import 'package:code/pages/regiater.dart';
import 'package:flutter/material.dart';


class well_come extends StatelessWidget {
  const well_come({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

          child: Column(
            children: [
              Image.asset('images/img-3.png',
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.55,
              fit: BoxFit.cover,),
              Image.asset(
                "images/logo.png",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      
                      child: MaterialButton(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Page()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Login ',style: TextStyle(color: Colors.white,fontSize: 16),

                          ),
                        ),
                          
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: Row(
                  children: [
                    Expanded(

                      child: MaterialButton(

                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black
                          ),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('Register',style: TextStyle(color: Colors.black,fontSize: 16),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),

              Spacer(),
              GestureDetector(
                onTap: (){

                },
                child: Text('Continue with a guest',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              ),
              Spacer()
              
              
            ],
        
        
      )
      ),
    );
  }
}
