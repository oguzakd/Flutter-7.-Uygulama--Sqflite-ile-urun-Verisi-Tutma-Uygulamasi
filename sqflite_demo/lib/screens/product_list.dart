import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/screens/product_add.dart';

import '../models/product.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductListState();
  }
}

class _ProductListState extends State {
  var dbHelper = DbHelper();
  List<Product>? products;
  int productCount = 0;

  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  ListView buildProductList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.cyan,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Text("P"),
            ),
            title: Text(this.products![position].name.toString()),
            subtitle: Text(this.products![position].description.toString()),
            onTap: () {},
          ),
        );
      },
      itemCount: productCount,
    );
  }

  void goToProductAdd() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd()));
    if (result != null) {
      if (result) {
        getProducts();
      }
    }
  }

  void getProducts() async{
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      this.products = data!.cast<Product>();
      productCount = data.length;
    });
  }
}
