// import 'package:flutter/material.dart';
//
// class WidgetPrefix extends StatefulWidget {
//   const WidgetPrefix({Key? key}) : super(key: key);
//
//   @override
//   State<WidgetPrefix> createState() => _WidgetPrefixState();
// }
//
// class _WidgetPrefixState() extends State<WidgetPrefix> {
//    String dropdownValue = 'One';
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_drop_down),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//           setState(() {
//             dropdownValue = newValue!;
//           });
//       },
//     );
//   }
//
// }