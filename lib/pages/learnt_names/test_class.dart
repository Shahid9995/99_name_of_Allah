//  import 'package:flutter/material.dart';
// import 'package:the_names/backend/schema/names_of_allah_record.dart';
//
// class TestClass extends StatefulWidget {
//   const TestClass({super.key});
//
//   @override
//   State<TestClass> createState() => _TestClassState();
// }
//
//
// class _TestClassState extends State<TestClass> {
//   @override
//   void initState() {
//     super.initState();
//     print("=====initState===${NamesOfAllahRecord.fromSnapshot(snapshot)}=======");
//     for(int i=0; i<NamesOfAllahRecord.fromSnapshot(snapshot))
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Column(
//         children: [
//           Flexible(
//             child: ListView.builder(
//               itemCount: 20,
//                 itemBuilder: (context,index){
//               return Center(
//                 child: Container(
//                   child: Text("$index"),
//                 ),
//               );
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
