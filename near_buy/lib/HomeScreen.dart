import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search Near You",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          ProductCard(
            title: 'General Store',
            description: 'Sugar\na sweet crystalline substance obtained from various plants',
            price: '100/kg',
          ),
          ProductCard(
            title: 'Electronic Store',
            description: 'Charger\nA device used to recharge batteries',
            price: '200₹',
          ),
          ProductCard(
            title: 'Pooja Items',
            description: 'Agarbatti\nFragrance wood stick used in pooja rituals',
            price: '20₹/100g',
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  ProductCard({required this.title, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.title),
        subtitle: Text(this.description),
        trailing: Text(this.price),
      ),
    );
  }
}
