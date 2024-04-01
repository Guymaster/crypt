import 'package:crypt/common/styles.dart';
import 'package:crypt/common/values.dart';
import 'package:crypt/models/collection.model.dart';
import 'package:flutter/material.dart';

class CreateFilePopUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CreateFilePopUpState();
  }

}

class CreateFilePopUpState extends State<CreateFilePopUp> {
  bool shouldCreateNewCollection = false;
  List<Collection> collections = [
    Collection("Firebase configd"),
    Collection("Supase prog"),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
            ))
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text("Cancel", style: FormLabelTxtStyle.classic(14, Colors.redAccent),),
        ),
        TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ))
          ),
          onPressed: (){
            //
          },
          child: Text("Encrypt it", style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),),
        ),
      ],
      backgroundColor: ColorPalette.getBlack(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      title: Text("Add new data", style: FormTitleTxtStyle.classic(20, ColorPalette.getWhite(1)),),
      content: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorPalette.getBlack(0.5),
                    labelText: "Title",
                    labelStyle: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),
                    border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  minLines: 10,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorPalette.getBlack(0.5),
                    labelText: "Content",
                    labelStyle: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),
                    border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Create a new collection?", style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),),
                    Checkbox(
                      splashRadius: 0,
                      value: shouldCreateNewCollection,
                      onChanged: (value){
                        setState(() {
                          shouldCreateNewCollection = (value ?? false);
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  enabled: shouldCreateNewCollection,
                  style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: shouldCreateNewCollection? ColorPalette.getBlack(0.5) : ColorPalette.getBlack(0.2),
                      labelText: "New collection name",
                      labelStyle: shouldCreateNewCollection? FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)) : FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.2)),
                      border: InputBorder.none
                  ),
                ),
                const SizedBox(height: 10,),
                DropdownButtonFormField<Collection>(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: !shouldCreateNewCollection? ColorPalette.getBlack(0.5) : ColorPalette.getBlack(0.2),
                    labelText: "Select a collection",
                    labelStyle: !shouldCreateNewCollection? FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)) : FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.2)),
                    border: InputBorder.none
                  ),
                  dropdownColor: ColorPalette.getBlack(0.7),
                  items: shouldCreateNewCollection? [] : collections.map((collection) => DropdownMenuItem<Collection>(
                    value: collection,
                    child: Text(collection.name, style: FormLabelTxtStyle.classic(14, ColorPalette.getWhite(0.7)),)),
                  ).toList(),
                  onChanged: (collection){
                    //
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}