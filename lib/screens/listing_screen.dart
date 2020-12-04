import 'package:flutter/material.dart';
import 'package:review_app/widgets/product_list.dart';

class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review App'),
      ),
      body:  ProductList() ,
    );
  }
}
