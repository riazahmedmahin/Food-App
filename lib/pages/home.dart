import 'package:flutter/material.dart';

class My_Home extends StatelessWidget {
  const My_Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('App bar',),

      ),
      
      body: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)

                    )
                  ),
                )
              ],
            ),
          ),
          

        ],

      ),
      
    );
  }
}
