import 'package:flutter/material.dart';

AppBar getAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Theme.of(context).colorScheme.secondary),
  );
}
