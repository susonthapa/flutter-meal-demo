import 'package:flutter/material.dart';
import 'package:meal_info/widgets/main_drawer.dart';

import 'category_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<String> favoritesIds;
  final Function removeFavorite;

  const HomeScreen({Key key, @required this.favoritesIds, @required this.removeFavorite})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _screens;
  var _activeIndex = 0;

  @override
  void initState() {

    super.initState();
  }

  void _onBottomNavItemClick(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _screens = [
      {
        'title': 'Categories',
        'screen': CategoryScreen(),
      },
      {
        'title': 'Favorites',
        'screen': FavoriteScreen(
          favoritesIds: widget.favoritesIds,
          removeFavorite: widget.removeFavorite,
        ),
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_activeIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeIndex,
        onTap: _onBottomNavItemClick,
        items: [
          BottomNavigationBarItem(
              title: Text('Categories'), icon: Icon(Icons.category)),
          BottomNavigationBarItem(
              title: Text('Favorites'), icon: Icon(Icons.favorite))
        ],
      ),
      drawer: MainDrawer(),
      body: _screens[_activeIndex]['screen'],
    );
  }
}
