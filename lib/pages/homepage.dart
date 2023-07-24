
import 'package:code/components/grosary_item_tile.dart';
import 'package:code/pages/cart_page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_tab.dart';
import '../module/itemcart.dart';

class Home_page extends StatefulWidget {
  Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {


  final user = FirebaseAuth.instance.currentUser;

  void SignOut() {
    FirebaseAuth.instance.signOut();
  }
//------------- all tab
List<Widget>myTabs=[

  MyTab(imagepath: 'images/burger.png',),
  MyTab(imagepath: 'images/donut.png',),
  MyTab(imagepath: 'images/pancakes.png',),
  MyTab(imagepath: 'images/pizzaa.png',),

];


//---------------------
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/logo.png'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            " " + user!.email!,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home,color: Colors.black,),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_page()));
                },
              ),
              ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.black,),
              ),
              ListTile(
                title: Text('profile'),
                leading: Icon(Icons.person_pin,color: Colors.black,),
              ),
              SizedBox(
                height: 400,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.logout,color: Colors.black,),
                onTap: SignOut,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
    
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Let's order, fresh items for you",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Divider(
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            
            Expanded(
    
                child: Container(
    
                  decoration: BoxDecoration(
                    color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                  ),
                  padding: EdgeInsets.all(11),
                  child: Consumer<cartModel>(builder: (context, value, child) {
    
                    return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                            childAspectRatio: 1/1.2
                    ),
                    itemBuilder: (context, index) {
                      return GrosaryItemTile(
                        itemname: value.shopItems[index][0],
                        itemprice: value.shopItems[index][1],
                        imagepath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: (){
                          Provider.of<cartModel>(context , listen: false).addTocart(index);
                        },
                      );
                    });
            }),
                )),

 //-------------------tab--------
                TabBar(tabs: myTabs),


//-------------------tab-----------

          ],
        ),

       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.white,
         child: Icon(Icons.shopping_cart,color: Colors.black,),

         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context){
           return CartPage();
         }))

       ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }
}
