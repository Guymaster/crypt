import 'package:crypt/models/collection.model.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  Collection collection;
  void Function(String name) onPressed;
  CollectionItem({super.key, required this.onPressed, required this.collection});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        onPressed(collection.name);
      },
      child: Text(collection.name)
    );
  }
  
}