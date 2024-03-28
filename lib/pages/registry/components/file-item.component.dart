import 'package:flutter/material.dart';
import 'package:crypt/models/file.model.dart';

class FileItem extends StatelessWidget {
  File file;
  void Function(String name) onPressed;
  FileItem({super.key, required this.onPressed, required this.file});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){
          onPressed(file.title);
        },
        child: Text(file.title)
    );
  }

}