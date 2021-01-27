import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CounterWithFavBtn extends StatefulWidget {
  final String price;
  const CounterWithFavBtn({
    Key key,this.price
  }) : super(key: key);

  @override
  _CounterWithFavBtnState createState() => _CounterWithFavBtnState();
}

class _CounterWithFavBtnState extends State<CounterWithFavBtn> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        Padding(padding: EdgeInsets.only(left:10)),

        Container(
          padding: EdgeInsets.all(6),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),

        ),

      ],
    );
  }
}
