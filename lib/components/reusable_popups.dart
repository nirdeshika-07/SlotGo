import 'package:flutter/material.dart';

class Notifications{
  static show(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped on indoor games.'))
    );
  }
}