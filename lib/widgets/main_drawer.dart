import 'package:flutter/material.dart';
import 'package:meal_info/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildDrawerItem(IconData icon, String title, Function onClick) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
      ),
      onTap: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            height: 250,
            color: Theme.of(context).accentColor.withOpacity(0.5),
            child: Center(
              child: Text(
                'Meal Info',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _buildDrawerItem(Icons.filter_list, 'Filter', () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
