import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> favorites = [];
  TextEditingController itemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorites'),
      ),
      body: Column(
        children: [
          _buildAddItemField(),
          Expanded(
            child: _buildFavoritesList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAddItemField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: itemController,
              decoration: InputDecoration(
                hintText: 'Add an item to favorites',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _addToFavorites(itemController.text);
              itemController.clear();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList() {
    if (favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet.'),
      );
    }

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(favorites[index]),
        );
      },
    );
  }

  void _addToFavorites(String item) async {
    if (item.isNotEmpty) {
      setState(() {
        favorites.add(item);
      });

      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('favorites', favorites);
    }
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final loadedFavorites = prefs.getStringList('favorites');
    if (loadedFavorites != null) {
      setState(() {
        favorites = loadedFavorites;
      });
    }
  }
}
