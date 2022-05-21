import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textapp/Menu/barcodepage.dart';
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
    return Scaffold(backgroundColor: Colors.red[50],
      appBar: AppBar(centerTitle: true,title: const Text('Menu',style: TextStyle(color: Color(0xfff40000a)),),
                                                          automaticallyImplyLeading: false,
                                                          backgroundColor: Colors.transparent,),
        body:
        Padding(
            padding: const EdgeInsets.all(10),
            
              child:Column(
                
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             ElevatedButton(
                          child: Icon(Icons.camera,size: 50,),
                          onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CameraPage()), );},
                          style:ElevatedButton.styleFrom(
                            // primary: Color(0xff9d666e), onPrimary: Color(0xfff1eaea),
                                                        fixedSize: Size(100,80) ),
                                                        
                        ),
                        SizedBox( width: 20,),
                        ElevatedButton(
                          child: Icon(Icons.qr_code,size: 50),
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Barcodepage()), );
                          },
                           style:ElevatedButton.styleFrom(
                            //  primary: Color(0xff9d666e), onPrimary: Color(0xfff1eaea),
                                                        fixedSize: Size(100,80) ),
                        ),
                          ],
                         
                        ),
                        SizedBox( height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          
                        ElevatedButton(
                          child: Icon(Icons.pageview, size: 50),
                          onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WebViewPage()), );},
                           style:ElevatedButton.styleFrom(
                            //  primary: Color(0xff9d666e),  onPrimary: Color(0xfff1eaea),
                                                        fixedSize: Size(100,80) ),
                        ),
                          SizedBox( width: 20,),
                        ElevatedButton(
                          child: Icon(Icons.map_outlined,size: 50),
                          onPressed: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Location()), );
                          },
                           style:ElevatedButton.styleFrom(
                            //  primary: Color(0xff9d666e),  onPrimary: Color(0xfff1eaea),
                                                        fixedSize: Size(100,80) ),
                        ),
                        ],),
                       
                         
                      ],
                    ),
                  ),
                 Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[ 
                      SizedBox( height: 200,),
                      ElevatedButton(onPressed: (){
                    getValidationData();
                    Navigator.pop(context);
                  }, child: Text("Logout"),
                  style:ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  fixedSize: Size(100,50) ,
                  // primary: Color(0xff9d666e), onPrimary: Color(0xfff40000a)
                  ),
                  )
                  ],
                  )
                ],
              ),
            
        ), 


    );
  }
}
