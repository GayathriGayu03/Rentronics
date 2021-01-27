import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailsScreen.dart';
import 'constants.dart';

class UserHomepage extends StatefulWidget {
  final String prduct,scity;

  const UserHomepage({Key key, this.prduct, this.scity}) : super(key: key);

  @override
  _UserHomepageState createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {


  String categorySelectedindex;
  int selectedIndex = 0;

  get dropdownvalue => widget.scity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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



    );
  }
  
  Widget buildProduct(){
   return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),

        child: FirebaseAnimatedList(

            shrinkWrap: true,
            query:  FirebaseDatabase.instance.reference().child("ProductDetails/e11FegQJ1NTq47zTGJieKcEjUEB2").child("${widget.prduct}").reference().orderByChild('City').equalTo('${dropdownvalue}'),
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index
                ) {
              Map dis = snapshot.value;

                return Container(

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details_Screen( productName: dis['productName'],Name:  dis['Name'],City: dis['City'],Phone: dis['Phone'],Price: dis['Price'],ProductDescription: dis['ProductDescription'],ProductType:dis['ProductType'],image:dis['image'],rentaldays: dis['RentalDays'],),
                            ),
                          );
                    },
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

                                child: Text("Rental Days: ${dis['RentalDays']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 20, 0, 0),

                                child: Text("Price:${dis['Price']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,color: Colors.black),
                                ),
                              ),

                            ],
                          ),


                        ],
                      ),
                    ),


                  ),

                );


                /*  */


              }


        ),


      ),
    );

}

}


