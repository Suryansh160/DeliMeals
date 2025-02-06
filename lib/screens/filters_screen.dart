import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget buildSwitchTile(String title, String description, bool currentVal,
      Function(bool) updateVal) {
    return SwitchListTile(
      value: currentVal,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Select meal type',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegeterian,
                  (newValue) {
                    setState(() {
                      _vegeterian = newValue;
                    });
                  },
                ),
                buildSwitchTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
