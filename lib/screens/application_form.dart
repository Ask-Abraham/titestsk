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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();
  List<String> items = ['นาย', 'นาง', 'นางสาว', 'เด็กชาย', 'เด็กหญิง'];
  String? selectedItem;
  DateTime selectedDate = DateTime.now();
  final TextEditingController _textEditingController = TextEditingController();
  int _selectedChoice = 1;

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
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(children: [
          const Text('Personal Infomation', style: TextStyle(fontSize: 20)),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
            child: Column(children: [
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
            ]),
          ),
          Row(
            children : const [
              Padding(
                padding: EdgeInsets.fromLTRB(0,15.0, 0, 5.0),
                child: Text('Nationality', style: TextStyle(fontSize: 20))
              )
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                  value: 1,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value as int;
                    });
                  }),
              Radio(
                  value: 2,
                  groupValue: _selectedChoice,
                  onChanged: (value) {
                    setState(() {
                      _selectedChoice = value as int;
                    });
                  }),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          )
        ]
      )
    );
  }
}
