import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends GetView {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Favorites",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView(
        children: const [],
      ),
    );
  }
}
