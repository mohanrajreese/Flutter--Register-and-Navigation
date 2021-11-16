// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';


class DisplayDetails extends StatefulWidget {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? gender;
  final String? phoneNumber;
  final String? address;
  final String? birthday;
  // ignore: use_key_in_widget_constructors
  const DisplayDetails({
    this.firstname,
    this.lastname,
    this.email,
    this.gender,
    this.phoneNumber,
    this.address,
    this.birthday,
  });

  @override
  _DisplayDetailsState createState() => _DisplayDetailsState();
}

class _DisplayDetailsState extends State<DisplayDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "DISPLAY DETAILS",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(5, 50, 0, 15),
          width: double.infinity,
          // height: ,
          padding: EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.grey[200],
            elevation: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('First Name - ${widget.firstname}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Last Name - ${widget.lastname}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Email - ${widget.email}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Phone Number - ${widget.phoneNumber}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Birthday - ${widget.birthday}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text('', style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Gender - ${widget.gender}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
                ListTile(
                  title: Text('Address - ${widget.address}',
                      style: TextStyle(fontSize: 18.0)),
                  subtitle: Text("", style: TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          ),
        )
      );
  }
}
