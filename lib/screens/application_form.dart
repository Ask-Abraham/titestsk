import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

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

enum Nationality { Thai, Expat }

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  List<String> items = ['นาย', 'นาง', 'นางสาว', 'เด็กชาย', 'เด็กหญิง'];
  String? selectedItem;
  DateTime selectedDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  Nationality _selectedChoice = Nationality.Thai;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2015, 8),
            lastDate: DateTime(2101))
        .then((selectedDate) {
      if (selectedDate != null) {
        _textEditingController.text =
            DateFormat.yMMMMd().format(selectedDate).toString();
      }
    });

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                child: Column(children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Personal Information',
                            style: TextStyle(fontSize: 20))
                      ]),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    hint: const Text('Prefix'),
                    autofocus: true,
                    // value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      selectedItem = item;
                    }),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Firstname'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.contains('@'))
                          ? 'Invalid Input'
                          : null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Lastname'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.length > 10)
                          ? 'Invalid Input'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        hintText: 'Birthdate',
                        suffixIcon: Icon(Icons.calendar_month)),
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDate(context);
                    },
                    validator: (String? value) {
                      return (value!.isEmpty) ? 'Invalid Input' : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Nationality', style: TextStyle(fontSize: 20)),
                      ]),
                  RadioListTile<Nationality>(
                    title: const Text('Thai'),
                    value: Nationality.Thai,
                    groupValue: _selectedChoice,
                    onChanged: (Nationality? value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Expat'),
                    value: Nationality.Expat,
                    groupValue: _selectedChoice,
                    onChanged: (Nationality? value) {
                      setState(() {
                        _selectedChoice = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'ID'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.length > 10)
                          ? 'Invalid Input'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Mobile Number'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.length > 10)
                          ? 'Invalid Input'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Email'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.length > 10)
                          ? 'Invalid Input'
                          : null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(hintText: 'Confirm Email'),
                    onSaved: (String? value) {
                      _formKey.currentState!.validate();
                    },
                    validator: (String? value) {
                      return (value!.isEmpty || value.length > 10)
                          ? 'Invalid Input'
                          : null;
                    },
                  ),
                ]),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save'),
              )
            ])));
  }
}
