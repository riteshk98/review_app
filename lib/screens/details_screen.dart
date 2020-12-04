import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:review_app/product_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class DetailsScreen extends StatelessWidget {


  Future<bool> getData(String data) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (_prefs.getInt(data) == null || _prefs.getInt(data) == 0) {
      return false;
    }
    return true;
  }

  void setData(String title) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(title, 1);
  }

  @override
  Widget build(BuildContext context) {
    double _userRating;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: true);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final description = routeArgs['description'];
    final rating = routeArgs['rating'];
    final users = routeArgs['totalUsers'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Text(
                'Description: ' + description,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            FutureBuilder(
              future: getData(title),
              builder: (ctx, snapshot) {
                if (snapshot.data == false) {
                  return Column(
                    children: [
                      SmoothStarRating(
                        rating: rating,
                        isReadOnly: false,
                        size: 32,
                        borderColor: Colors.black54,
                        onRated: (val) => _userRating = val,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      FlatButton(
                          child: Text('Submit'),
                          onPressed: () {
                            productProvider.setRating(id, _userRating, users , rating,);
                            setData(title);
                          })
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SmoothStarRating(
                        rating: rating,
                        isReadOnly: true,
                        size: 32,
                        borderColor: Colors.black54,
                      ),
                      Text('already rated'),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
