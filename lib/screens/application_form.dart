import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              // decoration: const InputDecoration(
              //   enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(width: 3, color: Colors.blue)),
              // ),
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
            SfDateRangePicker(
              view: DateRangePickerView.month,
              monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            ),
            // TextButton(onPressed: null, child: Text('Save')),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
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
