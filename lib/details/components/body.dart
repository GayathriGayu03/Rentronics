import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rentronics/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentronics/details/components/cartdetails.dart';
import '../../constants.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';


class Body extends StatefulWidget {

  final String Name,City,Phone,ProductDescription,ProductType,image,productName,RentalDays,Price;
  // ignore: non_constant_identifier_names


  const Body({Key key, this.Name, this.City, this.Phone,  this.ProductDescription, this.ProductType, this.image, this.productName,this.RentalDays,this.Price}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int noofitems=1;


  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(

      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(

              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[

                        Description(
                          ProductDes: widget.ProductDescription,
                        ),
                        Padding(padding: EdgeInsets.only(top:10),),

                        SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            cartdetails(context),
                            Padding(padding: EdgeInsets.only(left:50,),),
                            Text("Rs.${widget.Price}"),
                            Padding(padding: EdgeInsets.only(left:50,),),
                            CounterWithFavBtn(),
                          ],
                        ),

                        addtocart(BuildContext),
                        SizedBox(height: kDefaultPadding / 2),
                        //AddToCart(Productname:productName,price: Price,image: image,rentaldays: RentalDays,),

                      ],
                    ),
                  ),
                  ProductTitleWithImage(image: widget.image,ProductName: widget.productName,Price:widget.Price)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addtocart(BuildContext)
  {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(right: kDefaultPadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(

              ),
            ),
            child: IconButton(

                icon: SvgPicture.asset(
                  "assets/icons/add_to_cart.svg",
                  // color: product.color,
                ),

                onPressed: () async{
                  int x= int.parse(widget.Price);
                  final dbRef = FirebaseDatabase.instance.reference().child("cartdetails");
                  dbRef.push().set({

                    "productName": widget.productName,
                    "Price": x* noofitems,
                    "RentalDays": widget.RentalDays,
                    "Qty": noofitems,
                    "image": widget.image,
                  }).then((_) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Added to Cart')));

                  }).catchError((onError) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text(onError)));
                  });
                }


            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => cartdetailspage()));

                },
                child: Text(
                  "Rent  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget cartdetails(BuildContext context)
  {

    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (noofitems !=0) {
              setState(() {
                noofitems=noofitems-1;

              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            noofitems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                noofitems=noofitems+1;

              });
            }),
      ],
    );
  }
  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
  }




