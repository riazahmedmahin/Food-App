import 'package:flutter/material.dart';

class GrosaryItemTile extends StatelessWidget {

 final String itemname;
 final String itemprice;
 final String imagepath;
 final  color;
 final Function()? onPressed;

  const GrosaryItemTile({super.key,
    required this.itemname,
    required this.itemprice,
    required this.imagepath,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Image.asset(imagepath,
                height: 120,
                //width: 194,
              ),

              //---
              Text(itemname,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

              MaterialButton(
                onPressed: onPressed,
              color: color[800],
                child: Text(
                  " \$ "+ itemprice,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              )

            ],
          ),

      ),
    );
  }
}
