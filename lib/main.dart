import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:charcode/charcode.dart';
import 'package:weather_app/SecondScrean.dart';
import 'package:weather_app/Service.dart';
import 'package:weather_app/weather_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState>_scaffold=GlobalKey<ScaffoldState>();
  late Future<Main> futureWeather;
  int $deg = 0x00B0;
  late String _result='London';


  void _navigateAndDisplaySelection(BuildContext context) async{
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SecondScrean()),
    );
setState(() {


   _result=result;


}

);




  }

  fetchData()async{
    var res= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$_result&appid=874052e84d347c113b195247ec5518fa&units=metric'));
    if(res.statusCode==200)
    {
      var objOfJson= json.decode(res.body) ;
      return objOfJson;
    }
  }



@override
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     _result=_result;
   });

    fetchData();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              'images/hoodh-ahmed-MiLSst1yExk-unsplash.jpg',
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black38,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () async {
                       _navigateAndDisplaySelection(context);
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [
                    FutureBuilder<dynamic>(
                      future: fetchData(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.data['main']['temp']==null
                          ?Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ): Text(
                          '${snapshot.data['main']['temp']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                          ),
                        );

                      },

                    ),
                    Text(String.fromCharCode($deg),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        )),
                  ],
                ),
                Text(
                  'You must wear heavy clothes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
