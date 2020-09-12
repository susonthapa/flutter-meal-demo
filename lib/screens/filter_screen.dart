import 'package:flutter/material.dart';
import 'package:meal_info/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter';

  final Function saveFilter;
  final Map<String, bool> currentFilter;

  const FilterScreen(
      {Key key, @required this.currentFilter, @required this.saveFilter})
      : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  Widget _buildSwitchListItem(
      String title, String details, bool isEnabled, Function onChanged) {
    return SwitchListTile(
      onChanged: onChanged,
      value: isEnabled,
      title: Text(title),
      subtitle: Text(details),
    );
  }

  @override
  void initState() {
    _isGlutenFree = widget.currentFilter['gluten'];
    _isVegetarian = widget.currentFilter['vegetarian'];
    _isVegan = widget.currentFilter['vegan'];
    _isLactoseFree = widget.currentFilter['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
                'lactose': _isLactoseFree
              };
              widget.saveFilter(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Adjust meal filters',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListItem(
                    'Gluten-Free', 'Only include gluten free meal', _isGlutenFree,
                    (newValue) {
                  setState(
                    () {
                      _isGlutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListItem(
                    'Vegetarian', 'Only include vegetarian meal', _isVegetarian,
                    (newValue) {
                  setState(
                    () {
                      _isVegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListItem('Vegan', 'Only include vegan meal', _isVegan,
                    (newValue) {
                  setState(
                    () {
                      _isVegan = newValue;
                    },
                  );
                }),
                _buildSwitchListItem(
                    'Lactose', 'Only include lactose free meal', _isLactoseFree,
                    (newValue) {
                  setState(
                    () {
                      _isLactoseFree = newValue;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
