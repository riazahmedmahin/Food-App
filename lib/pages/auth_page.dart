import 'package:code/pages/homepage.dart';
import 'package:code/pages/login.dart';
import 'package:code/pages/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)  {
          if(snapshot.hasData){
            return Home_page();
          }
          else{
            return well_come();
          }
        },

      ),

    );
  }
}