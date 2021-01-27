import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class cartdetailspage extends StatefulWidget {
   @override
  _cartdetailspageState createState() => _cartdetailspageState();
}

class _cartdetailspageState extends State<cartdetailspage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),

        body: Container(
          color: Colors.pinkAccent[100],
          child: Column(
            children: [

              buildProduct()
            ],
          ),


        ),



      ),
    );
  }

  Widget buildProduct(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

        child: FirebaseAnimatedList(

            shrinkWrap: true,
            query:  FirebaseDatabase.instance.reference().child("cartdetails").reference(),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index
                ) {
              Map dis = snapshot.value;

              return Container(

                child: Card(

                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 4,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 5,
                        child: Image.network('${dis['image']}'),
                      ),

                      Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 40, 0, 0),
                            child: Text(
                              dis['productName'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                            child: Text("Quantity: ${dis['Qty']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                            child: Text("Rental Days: ${dis['RentalDays']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                            child: Text("Price: RS. ${dis['Price']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),


              );
            }

        ),
              ),
              );

  }

}


