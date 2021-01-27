import 'package:flutter/material.dart';
import '../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  final String image,ProductName,Price;

  const ProductTitleWithImage({Key key, this.image, this.ProductName,this.Price}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Text(
           "$ProductName",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(width: kDefaultPadding),
              Expanded(
               child: Hero(
                 tag: "",
                  child: Image.network(image)
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
