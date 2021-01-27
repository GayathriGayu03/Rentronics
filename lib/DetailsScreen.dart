import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentronics/constants.dart';
import 'package:rentronics/details/components/body.dart';
class Details_Screen extends StatefulWidget {
  final String Name,City,Phone,Price,ProductDescription,ProductType,image,productName,rentaldays;

  const Details_Screen({Key key, this.Name, this.City, this.Phone, this.Price, this.ProductDescription, this.ProductType, this.image, this.productName,this.rentaldays}) : super(key: key);


  @override
  _Details_ScreenState createState() => _Details_ScreenState();
}

class _Details_ScreenState extends State<Details_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar : buildAppBar(context),
      body: Body(productName: widget.productName,Name:widget.Name,City:widget.City,Phone:widget.Phone,Price:widget.Price,ProductDescription:widget.ProductDescription,ProductType:widget.ProductType,image:widget.image,RentalDays: widget.rentaldays,),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
