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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Username'),
              onSaved: (String? value) {
                _formKey.currentState!.validate();
              },
              validator: (String? value) {
                return (value!.isEmpty || value.contains('@')) ? 'Invalid Input': null;
              },
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              obscureText: true,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Password'),
              onSaved: (String? value) {
                _formKey.currentState!.validate();
              },
              validator: (String? value) {
                return (value!.isEmpty || value.length > 10) ? 'Invalid Input': null;
              },
            ),
            // TextButton(onPressed: null, child: Text('Save')),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState!.validate()){
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
