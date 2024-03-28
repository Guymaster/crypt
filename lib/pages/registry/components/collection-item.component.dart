import 'package:crypt/common/values.dart';
import 'package:crypt/models/collection.model.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  Collection collection;
  void Function(String name) onPressed;
  CollectionItem({super.key, required this.onPressed, required this.collection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 14,
            textBaseline: TextBaseline.ideographic
          )),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
          ))
        ),
        onPressed: (){
          onPressed(collection.name);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(collection.name),
        )
      ),
    );
  }
  
}