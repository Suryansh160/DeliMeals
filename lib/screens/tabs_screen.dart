import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(), 'title': 'Your Favourites'},
  ];
  int ind = 0;

  void page(int indx) {
    setState(() {
      ind = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Text('data'),
        ),
      ),
      appBar: AppBar(
        title: Text(pages[ind]['title'] as String),
      ),
      body: pages[ind]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: page,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: ind,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
