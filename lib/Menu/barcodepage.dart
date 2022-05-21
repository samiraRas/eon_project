import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class Barcodepage extends StatefulWidget {
  const Barcodepage({Key? key}) : super(key: key);

  @override
  State<Barcodepage> createState() => _BarcodepageState();
}

class _BarcodepageState extends State<Barcodepage> {
  String _data = "";

_scan() async{
    await FlutterBarcodeScanner.scanBarcode("#000000",  "CANCEL", true, ScanMode.BARCODE)
    .then((value) => setState(() => _data= value,));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barcode Scanner')),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlutterLogo(),
            ElevatedButton(onPressed: ()=>  _scan() , 
            child: Text("Scan BarCode"),
            ),
             Text("Result: $_data"),
          ],
             
        ),
        
      
    );
  }
}