import 'dart:io';

import 'package:flutter/material.dart';
import 'package:libserialport/libserialport.dart';

class ComConnectorComponentWidget extends StatefulWidget {

  const ComConnectorComponentWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ComConnectorComponentWidgetState createState() => _ComConnectorComponentWidgetState();

}

class _ComConnectorComponentWidgetState extends State<ComConnectorComponentWidget> {

  final name = SerialPort.availablePorts.first;

  void showReadPort() {
    final port = SerialPort(name);
    if (!port.openReadWrite()) {
      print(SerialPort.lastError);
      exit(-1);
    }

    //port.write(/* ... */);

    final reader = SerialPortReader(port);
    reader.stream.listen((data) {
      print('received: $data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term'
      ),
    );
  }

}