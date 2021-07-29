import 'package:flutter/material.dart';

class ComConnectorComponentWidget extends StatefulWidget {

  const ComConnectorComponentWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ComConnectorComponentWidgetState createState() => _ComConnectorComponentWidgetState();

}

class _ComConnectorComponentWidgetState extends State<ComConnectorComponentWidget> {
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