import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:crypt/common/dimensions.dart';
import 'package:crypt/common/styles.dart';
import 'package:crypt/common/values.dart';
import 'package:crypt/pages/registry/components/collection-item.component.dart';
import 'package:crypt/pages/registry/components/file-create-popup.component.dart';
import 'package:crypt/pages/settings/settings.page.dart';
import 'package:crypt/pages/welcome/welcome.page.dart';
import 'package:crypt/providers/secret_key.provider.dart';
import 'package:crypt/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../models/collection.model.dart';
import '../../models/file.model.dart';
import 'components/file-delete-popup.component.dart';
import 'components/file-edit-popup.component.dart';
import 'components/file-item.component.dart';
import 'components/unlock-popup.component.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({super.key});

  @override
  RegistryPageState createState(){
    return RegistryPageState();
  }
}

class RegistryPageState extends State<RegistryPage> {
  int selectedCol = 0;
  List<Collection> collections = [];
  List<File> files = [];

  @override
  void initState(){
    super.initState();
    checkHash();
    fetchCollections();
  }

  Future<void> fetchCollections() async {
    List<Collection> cls = await DbService.getCollections();
    setState(() {
      collections = cls;
    });
    if(collections.length > selectedCol){
      fetchFiles();
    }
    else{
      setState(() {
        files = [];
      });
    }
  }

  Future<void> checkHash() async {
    String? hash = await DbService.getHash();
    if(hash == null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const WelcomePage()
      ));
    }
  }

  Future<void> fetchFiles() async {
    List<File> fls = await DbService.getFiles(collections[selectedCol].id);
    setState(() {
      files = fls;
    });
    //C:\Users\LENOVO\StudioProjects\crypt\.dart_tool\sqflite_common_ffi\databases
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: Consumer<SecretKeyProvider>(
        builder: (context, secretKeyProvider, child) => FloatingActionButton(
          backgroundColor: ColorPalette.getGray(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          mini: MQ.getWidth(context) < 800,
          onPressed: () {
            if(secretKeyProvider.value.isEmpty) return;
            showDialog(
              context: context,
              builder: (context){
                return CreateFilePopUp(
                  secretKey: Provider.of<SecretKeyProvider>(context).value,
                  onCreateFile: (){
                    fetchCollections();
                  },
                );
              }
            );
          },
          child: const Icon(Icons.add),
        ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(width: 10,),
                              Text("Crypt", style: AppNameTxtStyle.classic(14, ColorPalette.getWhite(0.5)),),
                            ],
                          ),
                          Consumer<SecretKeyProvider>(
                            builder: (context, provider, widget) => IconButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                              ),
                              color: (provider.value.isEmpty? Colors.red : ColorPalette.getWhite(0.3)),
                              iconSize: 17,
                              onPressed: (){
                                Provider.of<SecretKeyProvider>(context, listen: false).value.isEmpty?
                                  showDialog(
                                      context: context,
                                      builder: (context){
                                        return const UnlockPopUp();
                                      }
                                  )
                                :
                                  Provider.of<SecretKeyProvider>(context, listen: false).value = "";
                              },
                              icon: Icon((provider.value.isEmpty? Icons.lock : Icons.lock_open))
                            ),
                          )
                        ],
                      ),
                    ),
                    Consumer<SecretKeyProvider>(
                      builder: (context, secreKeyProvider, _) => IconButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                          ),
                          onPressed: (){
                            if(secreKeyProvider.value.isEmpty) {
                              return;
                            }
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SettingsPage()));
                          },
                        iconSize: 15,
                          icon: Icon(Icons.settings, color: secreKeyProvider.value.isNotEmpty? ColorPalette.getWhite(0.4) : ColorPalette.getWhite(0.1),),
                          ),
                    ),
                    Flexible(
                      child: Container(color: ColorPalette.getBlack(0),),
                    ),
                    Row(
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                          ),
                          onPressed: (){
                            appWindow.minimize();
                          },
                          icon: SvgPicture.asset("assets/icons/hide-window.svg",
                          height: 15,
                          width: 15,
                        )),
                        IconButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                          ),
                          onPressed: (){
                          appWindow.maximizeOrRestore();
                        }, icon: SvgPicture.asset("assets/icons/maximize-window.svg",
                          height: 15,
                          width: 15,
                        )),
                        IconButton(
                          onPressed: (){
                            appWindow.close();
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(const RoundedRectangleBorder())
                          ),
                          icon: SvgPicture.asset("assets/icons/close-window.svg",
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
                              child: Consumer<SecretKeyProvider>(
                                builder: (context, secretKeyProvider, _) => CollectionItem(
                                  secretKey: secretKeyProvider.value,
                                  onPressed: (String name){
                                    setState(() {
                                      selectedCol = i;
                                    });
                                    fetchFiles();
                                  },
                                  handleEdit: (c) async {
                                    fetchCollections();
                                  },
                                  handleDelete: (c) async {
                                    fetchCollections();
                                  },
                                  collection: collections[i],
                                  selected: (i == selectedCol),
                                ),
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
                        handleDelete: (file) async {
                          showDialog(
                              context: context,
                              builder: (context){
                                return DeleteFilePopUp(
                                  secretKey: Provider.of<SecretKeyProvider>(context).value,
                                  onDeleteFile: (){
                                    fetchCollections();
                                  }, fileId: file.id,
                                );
                              }
                          );
                        },
                        handleEdit: (file) async {
                          showDialog(
                              context: context,
                              builder: (context){
                                return EditFilePopUp(
                                  secretKey: Provider.of<SecretKeyProvider>(context).value,
                                  defaultCollectionId: selectedCol,
                                  onEditFile: (){
                                    fetchCollections();
                                  }, fileId: file.id,
                                );
                              }
                          );
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