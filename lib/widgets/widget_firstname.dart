import 'package:flutter/material.dart';

class FirstNameWidget extends StatelessWidget{
  const FirstNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Firstname'
      ),
      onSaved: (String? value) {
        debugPrint('Onsaved');
      },
      validator: (String? value) {
        return (value != null && value.contains('@')) ? 'Invalid': null;
      },
      keyboardType: TextInputType.name,
    );
  }
}