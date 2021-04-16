import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        barcodes: [
          BarCodeItem(
            description: "Code128 with text",
            image: BarCodeImage(
              params: Code128BarCodeParams(
                "02711618574181",
                withText: true,
              ),
            ),
          ),
          BarCodeItem(
            description: "Code128",
            image: BarCodeImage(
              params: Code128BarCodeParams(
                "02711618574181",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.barcodes});
  final List<BarCodeItem> barcodes;
  final String title = "BarCode Flutter";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: widget.barcodes.map((element) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      element.description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: element.image,
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class BarCodeItem {
  String description;
  BarCodeImage image;
  BarCodeItem({
    this.image,
    this.description,
  });
}
