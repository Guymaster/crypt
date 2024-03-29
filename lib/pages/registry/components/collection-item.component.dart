import 'package:crypt/common/values.dart';
import 'package:crypt/models/collection.model.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatefulWidget {
  Collection collection;
  void Function(String name) onPressed;
  ItemMode mode = ItemMode.VIEW;
  CollectionItem({super.key, required this.onPressed, required this.collection});

  @override
  State<CollectionItem> createState() => _CollectionItemState();
}

class _CollectionItemState extends State<CollectionItem> {
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
          widget.onPressed(widget.collection.name);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(widget.mode.toString()),
        )
      ),
    );
  }
}