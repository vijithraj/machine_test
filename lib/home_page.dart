import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/cart_page.dart';
import 'package:machine_test/provider_class.dart';
import 'package:provider/provider.dart';

import 'class_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter=0;
  List store = [
  ListData(
  imagepath: "images/apple.jpeg",
  name: "Apple",
      unit: "unit:Doz",
  price: "Price:\$20"),
  ListData(
  imagepath: "images/banana.jpeg",
  name: "Banana",
      unit: "unit:Doz",

  price: "Price:\$30"),];


  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: store.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.white10, blurRadius: 10)
                ]),
                child: Card(
                  color: Colors.white24,
                  child: ListTile(
                    title: Text(
                      store[index].name,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            store[index].unit,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            store[index].price,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(store[index].imagepath))),
                    ),
                    trailing: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          counter++;
                        });
                        object.favorites(
                            store[index].imagepath,
                            store[index].name,
                            store[index].unit,
                            store[index].price);
                      },
                      label: const Text('Add To Cart'),
                      backgroundColor: Colors.brown,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
            );
          }),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Cart()));
            },
            label: const Text('Cart'),
            icon: const Icon(Icons.shopping_cart_sharp),
            backgroundColor: Colors.cyan)

    );
  }
}
