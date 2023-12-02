import 'package:flutter/material.dart';

class PDFScreen extends StatelessWidget {
  final String path;

  const PDFScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tareef'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.share,
            ),
          )
        ],
      ),
      body: Center(
        child: Expanded(
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
