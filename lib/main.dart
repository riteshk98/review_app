import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_app/models/product.dart';
import 'package:review_app/product_provider.dart';
import 'package:review_app/screens/details_screen.dart';
import 'package:review_app/screens/listing_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (ctx) => ProductProvider(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListingScreen(),
        routes: {'/details' : (ctx) => DetailsScreen(),},
      ),
    );
  }
}