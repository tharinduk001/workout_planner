import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(child: Text("add new page")),
        ),
      ),
    );
  }
}