// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:json_real_app_by_me/details_page.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'model/data.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<Data> listofData = [];
//   Future<List<Data>> getAppData() async {
//    try {
//       var api = 'https://jsonplaceholder.typicode.com/photos';
//     var data = await http.get(api);

//     //decode data from json
//     var jsonData = json.decode(data.body);
//     //empty object for Data
    

//     for (var i in jsonData) {
//       //move data to dATA CONSTRUCTOR
//       Data data = Data(i['id'], i['title'], i['url'], i['thumbnailUrl']);
//       //SEND TO   list as a  single data
//       listofData.add(data);
//     }
    
   
//    } catch (e) {
//      print(e);
//    }
//     return listofData;
//   }

//   @override
//   void initState() {
//     super.initState();
//     getAppData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('json parsing app'),
//         backgroundColor: Colors.orange,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               print('search');
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               print('add');
//             },
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text('Kalyan Biswas'),
//               accountEmail: Text('Kalyanb447@gmail.com'),
//               decoration: BoxDecoration(
//                 color: Colors.orange,
//               ),
//             ),
//             ListTile(
//               title: Text('First Page'),
//               leading: Icon(
//                 Icons.search,
//                 color: Colors.orange,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               title: Text('Second Page'),
//               leading: Icon(
//                 Icons.search,
//                 color: Colors.blue,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               title: Text('Third Page'),
//               leading: Icon(
//                 Icons.search,
//                 color: Colors.red,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               title: Text('Forth Page'),
//               leading: Icon(
//                 Icons.search,
//                 color: Colors.green,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             Divider(
//               height: 5.0,
//             ),
//             ListTile(
//               title: Text('Close'),
//               leading: Icon(
//                 Icons.close,
//                 color: Colors.red,
//               ),
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         children: <Widget>[
//           //first container
//           Container(
//             height: 250.0,
//             margin: EdgeInsets.all(10),
//             child: FutureBuilder(
//               future: getAppData(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int i) {
//                       return InkWell(
//                          onTap: (){
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context){
//                                 return Details(data: snapshot.data[i],);
//                               }
//                             ));
//                           },
//                                               child: Card(
//                           elevation: 10.0,
//                           child: Column(
//                             children: <Widget>[
//                               //image
//                               Image.network(
//                                 snapshot.data[i].url,
//                                 height: 150,
//                                 width: 150,
//                                 fit: BoxFit.cover,
//                               ),
//                               SizedBox(
//                                 height: 7.0,
//                               ),
//                               //
//                               Container(
//                                 height: 50.0,
//                                 margin: EdgeInsets.all(6.0),
//                                 child: Row(
//                                   children: <Widget>[
//                                     Container(
//                                       child: CircleAvatar(
//                                           backgroundColor: Colors.pink,
//                                           foregroundColor: Colors.white,
//                                           child: Text(
//                                               snapshot.data[i].id.toString())),
//                                     ),
//                                     SizedBox(
//                                       width: 6.0,
//                                     ),
//                                     Container(
//                                         width: 80,
//                                         child: Text(
//                                           snapshot.data[i].title,
//                                           maxLines: 1,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//           //first container
//           Container(            height: 300,
//             margin: EdgeInsets.all(10),
//             child: FutureBuilder(
//               future: getAppData(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   return ListView.builder(
//                     scrollDirection: Axis.vertical,
//                     itemCount: snapshot.data.length,
//                     itemBuilder: (BuildContext context, int i) {
//                       return Card(
//                         elevation: 5,
//                         child: ListTile(
//                           onTap: (){
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context){
//                                 return Details(data: snapshot.data[i],);
//                               }
//                             ));
//                           },
//                           title: Text(
//                             snapshot.data[i].title,
//                             style: TextStyle(color: Colors.black),
//                             maxLines: 1,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
