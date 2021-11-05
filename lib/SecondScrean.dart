
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 late String cityName;
class SecondScrean extends StatefulWidget {
  const SecondScrean({Key? key}) : super(key: key);

  @override
  _SecondScreanState createState() => _SecondScreanState();
}

class _SecondScreanState extends State<SecondScrean> {
 final citycontroller=TextEditingController();

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
              child: Column(


                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      Icon(Icons.location_city,size: 30,color: Colors.white,),
                      SizedBox(width: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,constraints: BoxConstraints(
                        maxWidth: 300
                      ),
                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                          ),
                          controller:citycontroller ,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          )


                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    setState(() {
                      cityName='${citycontroller.text}';
                      Navigator.of(context).pop(cityName);


                    });
                  },
                      
                      style:  ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.transparent),

                       
                      ),
                      child: Text(
                        'Get Weather',style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                       
                      ),
                      )
                  )

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
