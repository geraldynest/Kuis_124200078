import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:kuis_124200078/coffee.dart';

class DetailCoffee extends StatefulWidget {
  const DetailCoffee({key, required this.coffee}) : super(key: key);

  final CoffeeMenu coffee;

  @override
  State<DetailCoffee> createState() => _DetailCoffeeeState();
}

class _DetailCoffeeeState extends State<DetailCoffee> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9c82ff),
        title: Text("${widget.coffee.name}"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: (isFavorite)
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) / 3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.coffee.imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.coffee.imageUrls[index],
                      width: 200,
                      height: 210,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Color(0xff9c82ff),
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.coffee.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Description : ${widget.coffee.description}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Price : ${widget.coffee.price}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Ingredients : ${widget.coffee.ingredients}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Nutrition : ${widget.coffee.nutrition}",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Text(
                    "Review Average : ${widget.coffee.reviewAverage}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Review Count",
                  style: TextStyle(
                      color: Color(0xffcb59ae),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.coffee.reviewCount}",
                  style: TextStyle(
                      color: Color(0xffcb59ae),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    child: Text("Link Store"),
                    onPressed: () {
                      html.window.open(widget.coffee.linkStore, '');
                    }),
              ]),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  launch(url) {}
}
