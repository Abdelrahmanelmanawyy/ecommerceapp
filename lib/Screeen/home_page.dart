// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  Widget _buildFeauture(
      {required String name, required double price, required String image}) {
    return Card(
      child: Container(
        height: 250,
        width: 160,
        child: Column(
          children: [
            Container(
                height: 200,
                width: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/$image")),
                )),
            Text(
              "\$ $price",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            Text(
              "$name",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildCategory({required String t, }) {
    return CircleAvatar(
      maxRadius: 90,
      
      child: Text("$t")
    
    );
  }
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }
  int _selectedIndex = 0;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [IconButton(onPressed: SignOut, icon: Icon(Icons.logout))],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Column(children: <Widget>[
              Container(
                height: 120,
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                    Container(
                      height: 50,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Feature",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    ///////////
                  ],
                ),
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildFeauture(
                              name: "Samsung A10", price: 4000, image: "5.jpeg"),
                          _buildFeauture(
                              name: "Samsung A10", price: 4000, image: "6.jpeg"),
                         
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categorie",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    _buildCategory(t:"Samsung" , ),
                    _buildCategory(t: "Iphone",  ),
                    
                  ],
                ),
              ),
              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "New brands",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          _buildFeauture(
                              name: "Samsung A10", price: 4000, image: "7.jpeg"),
                          _buildFeauture(
                              name: "Samsung A10", price: 4000, image: "8.jpeg"),
                          
                        ]),
                    ]),
       
            ]),
            ]),
        
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        )
          ],
        ),
    ));
  }
}

