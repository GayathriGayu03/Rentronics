import 'package:flutter/material.dart';


import '../../constants.dart';

class Description extends StatelessWidget {
  final String ProductDes;

  const Description({Key key, this.ProductDes}) : super(key: key);

  @override



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding+10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        Text( "${ProductDes}" ,
        style: TextStyle(height: 1.5),),
      ],
        ),


    );
  }
}
