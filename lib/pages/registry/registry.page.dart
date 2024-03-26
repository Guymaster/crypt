import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class RegistryPage extends StatefulWidget {
  const RegistryPage({super.key});

  @override
  RegistryPageState createState(){
    return RegistryPageState();
  }
}

class RegistryPageState extends State<RegistryPage> {
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Crypt"),
                Row(
                  children: [
                    IconButton(onPressed: (){
                      appWindow.minimize();
                    }, icon: const Icon(Icons.minimize)),
                    IconButton(onPressed: (){
                      appWindow.maximizeOrRestore();
                    }, icon: const Icon(Icons.maximize)),
                    IconButton(onPressed: (){
                      appWindow.close();
                    }, icon: const Icon(Icons.close)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}