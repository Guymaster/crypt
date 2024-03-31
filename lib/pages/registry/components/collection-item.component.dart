import 'package:crypt/common/styles.dart';
import 'package:crypt/common/values.dart';
import 'package:crypt/models/collection.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatefulWidget {
  Collection collection;
  void Function(String name) onPressed;
  bool? selected = false;
  CollectionItem({super.key, required this.onPressed, required this.collection, this.selected});

  @override
  State<CollectionItem> createState() => _CollectionItemState();
}

class _CollectionItemState extends State<CollectionItem> {
  ItemMode mode = ItemMode.VIEW;
  FocusNode focusNode = FocusNode();
  FocusNode editFieldFocusNode = FocusNode();
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = widget.collection.name;
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    editFieldFocusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          focusNode.requestFocus();
          mode = ItemMode.VIEW;
        });
      },
      onSecondaryTapUp: (details){
        setState(() {
          focusNode.requestFocus();
          mode = ItemMode.MENU;
        });
      },
      onFocusChange: (isFocused){
        if(!isFocused){
          setState(() {
            focusNode.unfocus();
            mode = ItemMode.VIEW;
          });
        }
      },
      focusNode: focusNode,
      child: Container(
        color: widget.selected!? ColorPalette.getGray(.4) : null,
        height: 35,
        child: Stack(
          children: [
            if ([ItemMode.VIEW, ItemMode.MENU].contains(mode)) TextButton(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(CollectionNameTxtStyle.classic(14, ColorPalette.getWhite(1))),
                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ))
                ),
                onPressed: (){
                  widget.onPressed(widget.collection.name);
                  setState(() {
                    focusNode.requestFocus();
                    mode = ItemMode.VIEW;
                  });
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.collection.name),
                )
            ) else const SizedBox(),
            if (mode == ItemMode.MENU) GestureDetector(
              onSecondaryTapUp: (details){
                setState(() {
                  mode = ItemMode.VIEW;
                });
              },
              child: Container(
                color: ColorPalette.getBlack(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            mode = ItemMode.EDIT;
                            editFieldFocusNode.requestFocus();
                          });
                        },
                        iconSize: 15,
                        icon: const Icon(Icons.edit),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ))
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: IconButton(
                          onPressed: (){
                            //
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              ))
                          ),
                          iconSize: 15,
                          icon: const Icon(Icons.delete)
                      ),
                    ),
                  ],
                ),
              ),
            ) else const SizedBox(),
            if (mode == ItemMode.EDIT) Container(
              height: 35,
              color: ColorPalette.getBlack(1),
              child: TextField(
                focusNode: editFieldFocusNode,
                controller: textEditingController,
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.center,
                maxLength: 50,
                onSubmitted: (value){
                  //
                },
                style: CollectionNameTxtStyle.classic(14, ColorPalette.getWhite(1)),
                decoration: const InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 7)

                ),
              ),
            ) else const SizedBox(),
          ],
        ),
      ),
    );
  }
}