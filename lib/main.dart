import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';
import 'dart:convert';

void main() {
  return runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var finalData;
  Future<Map> getAllData() async {
    try {
      var api =
          "https://samples.openweathermap.org/data/2.5/weather?id=2172797&appid=b6907d289e10d714a6e88b30761fae22";

      var data = await http.get(api);
      var jsonData = json.decode(data.body);
      print(jsonData['coord']['lon']);

      this.finalData = jsonData;
      return jsonData;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }
 double degreeToCelsias(double f){
     double c=((5*f)-160)/9;
     return c;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather Application"),
          backgroundColor: Colors.orange,
        ),
        body: Container(
          //  height: 800,
          child: Stack(
            children: <Widget>[
              Container(
                height: 800,
                child: Image(
                  image: AssetImage('assets/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                // height: 100,
                right: 10,
                left: 10,
                bottom: 50,
                child: Container(
                  // padding: EdgeInsets.only(le),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  //   margin: EdgeInsets.all(50),
                  color: Colors.white70,
                  child: Column(
                    children: <Widget>[
                     // sys.country
                      Text('Name is : ${finalData['name'].toString()}'),
                      Text('country  is : ${finalData['sys']['country'].toString()}'),
                      Text('Temp is : ${degreeToCelsias(finalData['main']['temp']).toString()}F'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
