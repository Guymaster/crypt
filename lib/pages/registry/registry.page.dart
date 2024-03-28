import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crypt/common/dimensions.dart';
import 'package:crypt/common/values.dart';
import 'package:crypt/pages/registry/components/collection-item.component.dart';
import 'package:flutter/material.dart';

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
  List<Collection> collections = [
    Collection("name"),
    Collection("nom")
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
        onPressed: () {
          //
        },
        child: Text("OK"),
      ),
      body: Container(
        height: MQ.getHeight(context),
        width: MQ.getWidth(context),
        child: Column(
          children: [
            SizedBox(
              height: WINDOW_HEADER_HEIGHT.toDouble(),
              width: MQ.getWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: WINDOW_HEADER_HEIGHT.toDouble(),
                    width: WINDOW_SIDEBAR_WIDTH.toDouble(),
                    color: Colors.blueGrey,
                    child: Text("crrypt"),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        appWindow.minimize();
                      }, icon: const Icon(Icons.hide_image_outlined)),
                      IconButton(onPressed: (){
                        appWindow.maximizeOrRestore();
                      }, icon: const Icon(Icons.square_outlined)),
                      IconButton(onPressed: (){
                        appWindow.close();
                      }, icon: const Icon(Icons.close)),
                    ],
                  )
                ],
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
                    color: Colors.blueGrey,
                    child: ListView.builder(
                      itemCount: collections.length,
                      itemBuilder: (context, i) => CollectionItem(
                        onPressed: (String name){
                          //
                        },
                        collection: collections[i]
                      ),
                    ),
                  ),
                  Container(
                    width: MQ.getWidth(context) - WINDOW_SIDEBAR_WIDTH,
                    height: MQ.getHeight(context) - WINDOW_HEADER_HEIGHT,
                    color: Colors.greenAccent,
                    child: ListView.builder(
                      itemCount: collections.length,
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