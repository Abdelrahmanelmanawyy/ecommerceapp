import 'package:flutter/material.dart';
class ListProduct extends StatelessWidget {
   ListProduct({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: (){},),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search, color: Colors.black,)),

        ],
      ),
      
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
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
                            Container(
                              height: 800,
                              child: GridView.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.8,
                                
                                 children: [
                                _buildFeauture(
                                    name: "Samsung A10", price: 4000, image: "7.jpeg"),
                                _buildFeauture(
                                    name: "Samsung A10", price: 4000, image: "8.jpeg"),
                               _buildFeauture(
                                  name: "Samsung A10", price: 4000, image: "7.jpeg"),
                              _buildFeauture(
                                  name: "Samsung A10", price: 4000, image: "8.jpeg"),
                            _buildFeauture(
                                  name: "Samsung A10", price: 4000, image: "7.jpeg"),
                              _buildFeauture(
                                  name: "Samsung A10", price: 4000, image: "8.jpeg"),
                              ],),
                            )
                             
                       
   ]),
        ],
      ) );
  }
}