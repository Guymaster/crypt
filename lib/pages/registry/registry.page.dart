import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crypt/common/dimensions.dart';
import 'package:crypt/common/styles.dart';
import 'package:crypt/common/values.dart';
import 'package:crypt/pages/registry/components/collection-item.component.dart';
import 'package:crypt/providers/secret_key.provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../models/collection.model.dart';
import '../../models/file.model.dart';
import 'components/file-item.component.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({super.key});

  @override
  RegistryPageState createState(){
    return RegistryPageState();
  }
}

class RegistryPageState extends State<RegistryPage> {
  int selectedCol = 0;
  List<Collection> collections = [
    Collection("Firebase configd"),
    Collection("Supase prog"),
  ];
  List<File> files = [
    File("collection_name", "title", "content"),
    File("collection_name", "title", "content"),
    File("collection_name", "title", "content"),
  ];

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        mini: MQ.getWidth(context) < 800,
        onPressed: () {
          //
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        height: MQ.getHeight(context),
        width: MQ.getWidth(context),
        color: ColorPalette.getBlack(1),
        child: Column(
          children: [
            GestureDetector(
              onPanUpdate: (details){
                appWindow.position = appWindow.position + details.globalPosition;
              },
              /*dragStartBehavior: DragStartBehavior.,
              onHorizontalDragUpdate: (details){
                appWindow.position = appWindow.position + details.delta;
              },
              onVerticalDragUpdate: (details){
                appWindow.position = appWindow.position + details.delta;
              },*/
              child: SizedBox(
                height: WINDOW_HEADER_HEIGHT.toDouble(),
                width: MQ.getWidth(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: WINDOW_HEADER_HEIGHT.toDouble(),
                      width: WINDOW_SIDEBAR_WIDTH.toDouble(),
                      decoration: BoxDecoration(
                        color: ColorPalette.getDarkGray(1),
                        border: Border.all(
                          width: 0,
                          color: ColorPalette.getDarkGray(1)
                        )
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Consumer<SecretKeyProvider>(
                            builder: (context, provider, widget) => SizedBox(),
                          ),
                          Text("Crypt", style: AppNameTxtStyle.classic(14, ColorPalette.getWhite(0.5)),),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(color: ColorPalette.getBlack(0),),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            appWindow.minimize();
                          },
                          icon: SvgPicture.asset("assets/icons/hide-window.svg",
                          height: 15,
                          width: 15,
                        )),
                        IconButton(onPressed: (){
                          appWindow.maximizeOrRestore();
                        }, icon: SvgPicture.asset("assets/icons/maximize-window.svg",
                          height: 15,
                          width: 15,
                        )),
                        IconButton(onPressed: (){
                          appWindow.close();
                        }, icon: SvgPicture.asset("assets/icons/close-window.svg",
                          height: 15,
                          width: 15,
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MQ.getHeight(context) - WINDOW_HEADER_HEIGHT,
              width: MQ.getWidth(context),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: MQ.getHeight(context) - WINDOW_HEADER_HEIGHT,
                    decoration: BoxDecoration(
                        color: ColorPalette.getDarkGray(1),
                        border: Border.all(
                          width: 0,
                          color: ColorPalette.getDarkGray(1),
                        )
                    ),
                    child: ListView.builder(
                      itemCount: collections.length,
                      itemBuilder: (context, i) => Padding(
                        padding: EdgeInsets.only(top: (i == 0)? 10 : 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              child: CollectionItem(
                                  onPressed: (String name){
                                    setState(() {
                                      selectedCol = i;
                                    });
                                  },
                                  collection: collections[i],
                                  selected: (i == selectedCol),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MQ.getWidth(context) - WINDOW_SIDEBAR_WIDTH,
                    height: MQ.getHeight(context) - WINDOW_HEADER_HEIGHT,
                    color: ColorPalette.getBlack(1),
                    child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, i) => FileItem(
                          onPressed: (String name){
                            //
                          },
                          file: files[i],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}