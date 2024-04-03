import 'package:crypt/common/values.dart';
import 'package:crypt/models/file.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FileComponent extends StatefulWidget {
  final File file;
  const FileComponent({super.key, required this.file});

  @override
  FileComponentState createState() {
    return FileComponentState();
  }
}

class FileComponentState extends State<FileComponent> {
  String? decriptedContent;
  ItemMode mode = ItemMode.VIEW;

  handleDelete() {
    //
  }

  handleUpdate() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}