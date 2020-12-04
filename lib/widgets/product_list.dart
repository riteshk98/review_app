import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_app/models/product.dart';
import 'package:review_app/product_provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return StreamBuilder<List<Product>>(
        stream: productProvider.products,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 7,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/details', arguments: {
                        'id': snapshot.data[index].id,
                        'title': snapshot.data[index].title,
                        'description': snapshot.data[index].description,
                        'rating': snapshot.data[index].rating,
                        'totalUsers': snapshot.data[index].totalUsers,
                      }),
                      child: ListTile(
                        leading: Text(snapshot.data[index].title),
                        trailing: Text(snapshot.data[index].rating.toStringAsFixed(2)),
                      ),
                    ));
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
