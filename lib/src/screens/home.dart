import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  MyHome({Key key}) : super(key: key);

  final scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffKey,
      appBar: AppBar(
        title: Text("Drawer, Snack and Dialogs"),
      ),
      // Create Context for Scaffold to show a snackbar by Scaffold's context
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text("Show a Snackbar"),
                  onPressed: () => showSnackBar(context),
                ),
                FlatButton(
                  child: Text("Show a SimpleDialog"),
                  onPressed: () => _showDialog(context),
                ),
                FlatButton(
                  child: Text("Show an AlertDialog"),
                  onPressed: () => _showAlertDialog(context),
                )
              ],
            ),
          );
        },
      ),
      drawer: getDrawer(context),
      // Open the Drawer from other widget
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        onPressed: () => scaffKey.currentState.openDrawer(),
      ),
    );
  }

  Widget getDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          // Custom Header
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlutterLogo(size: 50),
                Text("Hi I'm a Drawer!")
              ],
            ),
          ),
          // Elements of a drawer as google implements
          UserAccountsDrawerHeader(
            accountEmail: Text("test@test.com"),
            accountName: Text("Test master"),
            currentAccountPicture: FlutterLogo(),
            otherAccountsPictures: <Widget>[
              FlutterLogo(),
              FlutterLogo(),
            ],
            onDetailsPressed: () {},
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blueGrey],
                    end: Alignment.bottomRight)),
          ),
          // Elements in the drawer
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: () => showHome(context),
          )
        ],
      ),
    );
  }

  void showHome(BuildContext context) {
    // Hide navigation drawer
    Navigator.pop(context);
  }

  // Custom Dialog
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("HI!"),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("I'm a Simple Dialog!")],
              ),
              ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.more),
                onTap: () => Navigator.pop(context),
              )
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        // Do not close by clicking outside
        barrierDismissible: false);
  }

  // Custom Alert Dialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("IMPORTANT"),
            content: Text("THIS IS AN ALERT DIALOG"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        barrierDismissible: false);
  }

  // Create Custom Snackbar with context
  void showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      content: Text("Hi!! I'm a Snackbar!"),
      action: SnackBarAction(
        label: "MORE",
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
