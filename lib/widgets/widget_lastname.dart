import 'package:flutter/material.dart';

class LastNameWidget extends StatelessWidget{

  const LastNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
          hintText: 'Lastname'
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