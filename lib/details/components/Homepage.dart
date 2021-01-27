import 'package:flutter/material.dart';
import 'package:rentronics/userdashboard.dart';
import 'package:rentronics/usersignuppage.dart';
class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          height: MediaQuery
              .of(context)
              .size
              .height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                Colors.lightBlue[800],
                Colors.lightBlue[500],
                Colors.lightBlue[200]
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(45, 100, 0, 0),
                  child: Text(
                    "HOME RENTRONICS",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 1200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("VENDOR", style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => sign()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                height: 100,
                width: 1200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: InkWell(
                                child: Text("USER", style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Avenir',
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500),),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => HomepageGrid()));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
