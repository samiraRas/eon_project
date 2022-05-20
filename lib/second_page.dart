import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textapp/Menu/camera.dart';
import 'package:textapp/Menu/location.dart';

import 'package:textapp/Menu/webview.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var finalEmail;
  

 

  Future getValidationData() async{
    
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var obtainedEmail= sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtainedEmail;
    });
    print('Email: $finalEmail');
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text('Menu'), automaticallyImplyLeading: false,),
        body: Padding(
            padding: const EdgeInsets.all(10),
            
              child: Row(
                
                children: [
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        child: new Text('Camera'),
                        onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CameraPage()), );},
                      ),
                      ElevatedButton(
                        child: Text('Barcode'),
                        onPressed: () {/** */},
                      ),
                      ElevatedButton(
                        child: Text('Webview'),
                        onPressed: () { Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebViewPage()), );},
                      ),
                      ElevatedButton(
                        child: Text('Location'),
                        onPressed: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Location()), );
                        },
                      ),
                    ],
                  ),
                  Column(children: [ElevatedButton(onPressed: (){
                    getValidationData();
                    // Navigator.pop(context);
                  }, child: Text("Logout"))],)
                ],
              ),
            
        ), 

    );
  }
}
