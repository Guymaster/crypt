import 'package:contextual_menu/contextual_menu.dart';
import 'package:crypt/common/dimensions.dart';
import 'package:crypt/common/styles.dart';
import 'package:crypt/common/values.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:crypt/models/file.model.dart';
import 'package:flutter/services.dart';

import 'file-item-menu.component.dart';

class FileItem extends StatefulWidget {
  File file;
  Future<void> Function(File file) handleEdit;
  Future<void> Function(File file) handleDelete;
  FileItem({super.key, required this.handleEdit, required this.handleDelete, required this.file});

  @override
  State<FileItem> createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapUp: (details){
        popUpContextualMenu(
          FileItemMenu((){
            Clipboard.setData(ClipboardData(text: widget.file.content));
          }, (){
            widget.handleEdit(widget.file);
          }, (){
            widget.handleDelete(widget.file);
          }),
          placement: Placement.bottomLeft,
        );
      },
      child: Card(
        elevation: 0,
        color: ColorPalette.getDarkGray(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: (MQ.getWidth(context) > 800)? 90 : 10),
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
              hasIcon: false
          ),
          header: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(widget.file.title, style: FileNameTxtStyle.classic(15, ColorPalette.getWhite(1)),),
          ),
          collapsed: const SizedBox(),
          expanded: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: SelectableText(widget.file.content, style: FileContentTxtStyle.classic(14, ColorPalette.getWhite(0.7)),),
            ),
          ),
        ),
      ),
    );
  }
}