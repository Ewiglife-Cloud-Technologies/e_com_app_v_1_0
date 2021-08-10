import 'package:flutter/material.dart';
import 'package:flutter_simple_shopify/models/models.dart';
import 'package:flutter_simple_shopify/shopify/shopify.dart';

import 'LoginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _usr;
  ShopifyUser user;
  ShopifyAuth auth = ShopifyAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usr = auth.currentUser(deleteThisPartOfCache: true);
    ShopifyUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _usr != null ? Text(_usr.toString()) : Text('Home'),
          ),
          ElevatedButton(
              onPressed: () async {
                await auth.signOutCurrentUser();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)))),
              child: Text(
                'SignOut',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
        ],
      ),
    );
  }
}
