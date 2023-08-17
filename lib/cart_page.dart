import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/provider_class.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final object = Provider.of<Provider_class>(context);
    List namestor = object.favoritename;
    List namestoreI = object.favoriteimage;
    List namestoreP = object.favoriteprice;
    List namestoreU = object.favoriteunit;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Product List",
            style: TextStyle(fontSize: 23, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: namestor.length,
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
                    leading: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(namestoreI[index]))),
                    ),
                    title: Text(
                      namestor[index],
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            namestoreU[index],
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            namestoreP[index],
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    trailing: FloatingActionButton.extended(
                      onPressed: () {
                        object.favorites(namestoreI[index], namestor[index],
                            namestoreU[index], namestoreP[index]);
                      },
                      label: const Text('RemoveCart'),
                      backgroundColor: Colors.brown,
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
