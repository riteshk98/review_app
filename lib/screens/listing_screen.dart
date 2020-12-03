import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_app/models/product.dart';
import 'package:review_app/product_provider.dart';
import 'package:review_app/widgets/product_list.dart';

class ListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review App'),
      ),
      body: ChangeNotifierProvider(child: ProductList(),create:(ctx) => ProductProvider() ,),
    );
  }
}
