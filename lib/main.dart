// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:webviewexample/ShopOrder.dart';


import 'dart:io';

import 'Professional.dart';

void main() {
  // SystemChrome.setPreferredOrientations(DeviceOrientation.portraitUp);
  runApp( MyApp1());
}

class MyApp1 extends StatelessWidget {
  // const MyApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override



  Widget build(BuildContext context)

  {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return OverlaySupport.global(child:  MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.black,
      ),
      home: MainPage(),
    ));


  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool hasInternet = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        left: true,
        top: true,
        right: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.zero,

        child:Scaffold(

          backgroundColor: Colors.black,

          body: SingleChildScrollView(

            child:   Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg.jpeg"),
                      fit: BoxFit.cover),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    Container(
                      padding: const EdgeInsets.all(0.0),// here is it
                      height: 200,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/ProfessionalFilms2.png"),
                            fit: BoxFit.cover),
                        color: Colors.black,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(0.0),
                          topRight: const Radius.circular(0.0),



                        ),
                      ),
                    ),
                    // SizedBox(height:10),


                    Container(
                      padding: EdgeInsets.only(top: 0),
                      child:
                      Column(


                        children: [

                          InkWell(
                              onTap: () async {
                                hasInternet = await InternetConnectionChecker().hasConnection;
                                if(hasInternet == true) {

                                  print('Internet Connected');

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyApp()),
                                  );


                                } else {
                                  print('No internet :( Reason:');
                                  setState(() {
                                    loading =false;
                                  });


                                  showSimpleNotification(
                                    Text("No Internet", style: TextStyle(color: Colors.white,fontSize: 20),
                                    ),
                                    background: Colors.red,

                                  );
                                }




                                print("Tapped a Container");
                              },
                              child:   Container(
                                height: 150,
                                width: 250,
                                decoration: new BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/EmarketCard.png"),
                                      // fit: BoxFit.cover
                                  ),
                                ),

                              )
                          ),
                          SizedBox(height: 15,),
                          const Divider(
                            thickness:1, // thickness of the line
                            indent: 50, // empty space to the leading edge of divider.
                            endIndent: 50, // empty space to the trailing edge of the divider.
                            color: Colors.grey, // The color to use when painting the line.
                            height: 20, // The divider's height extent.
                          ),
                          SizedBox(height: 15,),
                          InkWell(
                              onTap: () async {
                                hasInternet = await InternetConnectionChecker().hasConnection;
                                if(hasInternet == true) {

                                  print('Internet Connected');

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ShopOrder()),
                                  );


                                } else {
                                  print('No internet :( Reason:');
                                  setState(() {
                                    loading =false;
                                  });


                                  showSimpleNotification(
                                    Text("No Internet", style: TextStyle(color: Colors.white,fontSize: 20),
                                    ),
                                    background: Colors.red,

                                  );
                                }




                                print("Tapped a Container");
                              },
                              child:   Container(
                                height: 150,
                                width: 250,
                                decoration: new BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/ShopOrderCard.png"),

                                      // fit: BoxFit.cover
                                  ),
                                ),

                              )
                          ),


                          // SizedBox(height: 55,),






                          SizedBox(height: 20,),



                        ],

                      ),




                    ),


                    Column(
                      children: [  Container(
                        child: new Text("0506236025 : للتواصل ",

                          style: new TextStyle(fontSize: 14.0,
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),),

                        ),

                      ),
                        Container(
                          child:new Text("info@prowindowfilms.com ",

                            style: new TextStyle(fontSize: 14.0,
                              letterSpacing: 0.4,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff000000),),

                          ),

                        ),],
                    ),


                    SizedBox(height: 20,)

                  ],

                )),
          )









        )
    );



  }
}

void openurl() {


  String url="https://www.prowindowfilms.com/";
  launch(url);


}



