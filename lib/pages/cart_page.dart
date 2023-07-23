import 'package:code/module/itemcart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cart'),titleSpacing: 0,),

   body: Consumer<cartModel>(builder: (context , value ,child){
     return  Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Container(
             padding: EdgeInsets.symmetric(horizontal: 60 ,vertical: 8 ),
            // margin: EdgeInsets.all(20) ,
             decoration: BoxDecoration(
               color: Colors.black,
                   borderRadius: BorderRadius.circular(12),
             ),

             child: Text('Cart',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
          ),
         ),


         Expanded(
             child: ListView.builder(
               itemCount: value.CartItem.length,
                 padding: EdgeInsets.all(12),
                 itemBuilder: (context , index){
                   return Padding(
                     padding: const EdgeInsets.all(12),
                     child: Container(
                       padding: EdgeInsets.all(12),
                       decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(12)
                       ),
                       child: ListTile(
                         title: Text(value.CartItem[index][0],),
                         leading: Image.asset(value.CartItem[index][2],height: 36,),
                         subtitle: Text("\$" +  value.CartItem[index][1]),
                         trailing: IconButton(
                            icon: Icon(Icons.cancel_outlined), 
                           onPressed:()=> Provider.of<cartModel>(context, listen: false).removeFromcart(index)
                         ),
                         
                       ),
                     ),
                   );
                 }
             )
         ),


         // total amount + pay now

         Padding(
           padding: const EdgeInsets.all(36.0),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color: Colors.green,
             ),
             padding: const EdgeInsets.all(24),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       'Total Price',
                       style: TextStyle(color: Colors.green[200]),
                     ),

                     const SizedBox(height: 8),
                     // total price
                     Text(
                       '\$${value.calculateTotal()}',
                       style: const TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                     ),
                   ],
                 ),

                 // pay now
                 Container(
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.green.shade200),
                     borderRadius: BorderRadius.circular(28),
                   ),
                   padding: const EdgeInsets.all(12),
                   child: Row(
                     children: const [
                       Text(
                         'Pay Now',
                         style: TextStyle(color: Colors.white),
                       ),
                       Icon(
                         Icons.arrow_forward_ios,
                         size: 16,
                         color: Colors.white,
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         )

       ],
     );
   })

    );
  }
}
