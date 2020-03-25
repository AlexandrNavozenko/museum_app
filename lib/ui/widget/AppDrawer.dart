import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text('NoName@test.com'),
            accountName: Text('NoName'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://nnmclub.ch/forum/images/logos/logo_sun.png'),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Adding new accounts ...'),
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text(
              'Smth',
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
            trailing: Chip(
                label: Text(
                  '11',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.blue[100]),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.cog),
                title: Text(
                  'Settings',
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
