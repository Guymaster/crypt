import 'package:crypt/common/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:crypt/models/file.model.dart';

class FileItem extends StatelessWidget {
  File file;
  void Function(String name) onPressed;
  FileItem({super.key, required this.onPressed, required this.file});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      margin: EdgeInsets.symmetric(vertical: 7, horizontal: (MQ.getWidth(context) > 800)? 90 : 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(file.title),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(file.content),
            )
          ],
        ),
      ),
    );
  }

}