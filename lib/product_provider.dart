import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:review_app/models/product.dart';

class ProductProvider with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _product;

  String get product => _product;

  Stream<List<Product>> get products => _firestore
      .collection('products')
      .orderBy('rating', descending: true)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJson(doc.data())).toList());

  Future<void> setRating(String id, double rating , int users , double prevRating) {
    final finalRating = ((prevRating*users)+ rating)/ (users+1);
    notifyListeners();
    return _firestore
        .collection('products')
        .doc(id.trim())
        .update({'rating': finalRating,'users' : users+1});

  }



  // Future<void> insert()async{
  //   await UserPrefs.insert('review', {'name' : 'samsung', 'value' :1 });
  // }

}
