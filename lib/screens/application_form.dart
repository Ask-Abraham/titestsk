import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:titestsk/widgets/widget_lastname.dart';
import 'package:titestsk/widgets/widget_audio.dart';
import 'package:titestsk/widgets/widget_firstname.dart';

class ApplicationForm extends StatelessWidget {
  const ApplicationForm({Key? key}) : super(key: key);
  static const String _title = '2nd Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: const [
            FirstNameWidget(),
            LastNameWidget(),
            AudioWidget(),
          ],
        ),
      ),
    );
  }
}
