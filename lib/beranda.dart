import 'package:flutter/material.dart';
import 'package:kuis_124200078/coffee.dart';
import 'package:kuis_124200078/detail.dart';

class CoffeePlatform extends StatelessWidget {
  // const Beranda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final CoffeeMenu coffee = coffeeList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailCoffee(coffee: coffee);
              }));
            },
            splashColor: Color(0xff9c82ff),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Image.network(
                      coffee.imageUrls[1],
                      width: 250,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      coffee.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: coffeeList.length,
      ),
    );
  }
}
