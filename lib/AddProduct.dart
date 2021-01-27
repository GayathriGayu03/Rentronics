import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class productupload extends StatefulWidget {
  final UserCredential user;
  const productupload({Key key, this.user}) : super(key: key);
  @override
  _productuploadState createState() => _productuploadState();
}

class _productuploadState extends State<productupload> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      Colors.blue[400],
                      Colors.blue[600],
                      Colors.blue[800]
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: SizedBox(
                  height: 200,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 100, 0, 0),
                    child: Text(
                      "Add Rental Products",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(223, 202, 232, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom:
                                      BorderSide(color: Colors.purple[100]),
                                    ),
                                  ),
                                  child: product_details(user: widget.user),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final dbRef = FirebaseDatabase.instance.reference().child("ProductDetails");
class product_details extends StatefulWidget {
  final UserCredential user;

  const product_details({Key key, this.user}) : super(key: key);
  @override
  _product_detailsState createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue, citydropdownValue;
  final city = ["Chennai", "Vilupuram", "Coimbatore", "Vellore","Madurai","Cuddalore","Erode","Nagarcoil","Thoothukudi","Dindigul","Trichy"];
  final product_cateogory = ["Kettle", "Fridge", "Induction Stove", "TV","Microwave oven","Coffee Maker","Washing Machine","Grinder"];
  final PriceController = TextEditingController();
  final ProductDescriptionController = TextEditingController();
  final NameController = TextEditingController();
  final PhoneController = TextEditingController();
  final RentalDaysController = TextEditingController();
  final productnameController=TextEditingController();
  var x;
  File _image;
  String _uploadedFileURL;
  Future chooseFile() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = File(image.path);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ),
            child: DropdownButtonFormField(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Choose Product",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: product_cateogory.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                }),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: productnameController,
              decoration: InputDecoration(
                labelText: "Enter Product Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Product Name';
                }

                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: ProductDescriptionController,
              decoration: InputDecoration(
                labelText: "Enter Product Description",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Product Description';
                }
                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: PriceController,
              decoration: InputDecoration(
                labelText: "Enter price",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Product Price';
                }

                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: RentalDaysController,
              decoration: InputDecoration(
                labelText: "Rental Days",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Rental Days';
                }

                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200])),
            ),
            child: DropdownButtonFormField(
                value: citydropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Choose City",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: city.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    citydropdownValue = newValue;
                  });
                }),
          ),

          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: NameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Name';
                }

                return null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[200]))),
            child: TextFormField(
              controller: PhoneController,
              decoration: InputDecoration(
                labelText: "Enter Phone Number",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter Phone Number';
                }

                return null;
              },
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Text('Selected Image'),
                _image != null
                    ? Image.asset(
                  _image.path,
                  height: 150,
                )
                    : Container(height: 100),
                _image == null
                    ? RaisedButton(
                  child: Text('Choose File'),
                  onPressed: chooseFile,
                  color: Colors.cyan,
                )
                    : Container(),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),
          RaisedButton(
            child: Text("Post Now"),
            color: Colors.orangeAccent,
            onPressed: () async {

              if (_formKey.currentState.validate()) {
                try {
                  // Make random image name.
                  int randomNumber = Random().nextInt(100000);
                  String imageLocation = 'ProductDetails/image${randomNumber}${(_image.path)}';

                  // Upload image to firebase.
                  final firebase_storage.Reference ref = firebase_storage
                      .FirebaseStorage.instance.ref().child(imageLocation);
                  await ref.putFile(_image).whenComplete(() {
                    ref.getDownloadURL().then((fileURL) {
                      _uploadedFileURL = fileURL;

                      dbRef.child(widget.user.user.uid).child(dropdownValue).push().set({
                        "ProductType": dropdownValue,
                        "productName": productnameController.text,
                        "Price": PriceController.text,
                        "RentalDays": RentalDaysController.text,
                        "City": citydropdownValue,
                        "ProductDescription": ProductDescriptionController.text,
                        "Name": NameController.text,
                        "Phone": PhoneController.text,
                        "image": _uploadedFileURL
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        ProductDescriptionController.clear();
                        PhoneController.clear();
                        PriceController.clear();
                        NameController.clear();
                        RentalDaysController.clear();
                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      });
                    }
                    );
                  }
                  );
                } catch (e) {
                  print(e.message);
                }

              };
            },
          ),
        ],
      ),
    );
  }



}
