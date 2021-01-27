import 'package:flutter/material.dart';

import 'package:rentronics/userhomepage.dart';

import 'constants.dart';
class HomepageGrid extends StatefulWidget {
  @override
  _HomepageGridState createState() => _HomepageGridState();
}

class _HomepageGridState extends State<HomepageGrid> {
  String dropdownValue = 'Chennai';

  List<String> city = ["Chennai", "Vilupuram", "Coimbatore", "Vellore","Cuddalore","Erode","Nagarcoil","Thoothukudi","Dindugal"];
  List<String> categories = ["Kettle", "Fridge", "Induction Stove", "TV","Microwave Oven","Grinder","Coffee Maker","Washing Machine"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: dropdownValue,
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(child: Text("Chennai"), value: "Chennai"),
            DropdownMenuItem(child: Text("Vilupuram"), value: 'Vilupuram',),
            DropdownMenuItem(child: Text("Coimbatore"), value: 'Coimbatore'),
            DropdownMenuItem(child: Text("Vellore"), value: 'Vellore'),
            DropdownMenuItem(child: Text("Madurai"), value: 'Madurai'),
            DropdownMenuItem(child: Text("Cuddalore"), value: 'Cuddalore'),
            DropdownMenuItem(child: Text("Erode"), value: 'Erode',),
            DropdownMenuItem(child: Text("Nagarcoil"), value: 'Nagarcoil'),
            DropdownMenuItem(child: Text("Thoothukudi"), value: 'Thoothukudi'),
            DropdownMenuItem(child: Text("Dindugal"), value: 'Dindugal')
          ],
          onChanged: (String value) {
            setState(() {
              dropdownValue = value;
            });
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GridView.builder(

                    itemCount: categories.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: kDefaultPadding,
                      crossAxisSpacing: kDefaultPadding,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return new GestureDetector(
                          child: new Card(
                          elevation: 5.0,
                          child: new Container(
                          alignment: Alignment.center,
                          child: new Text(categories[index]),
                      ),
                      ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => UserHomepage(
                            prduct: categories[index],scity: dropdownValue,
                          ),
                          ),
                          );
                        },
                      );

                    }
                      /*  press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          )),*/
                    )),
              ),

          ],
        ),
      ),

    );
  }
}