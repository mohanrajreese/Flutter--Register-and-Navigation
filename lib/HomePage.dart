
// ignore_for_file: file_names, prefer_const_constructors

import 'package:ex1/main.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? email;
  String? gender;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) 
    {
      setState(() 
      {
        selectedDate = picked;
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20
              ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          
                          onSaved: (newValue) => firstName = newValue,
                          onChanged: (value) {
                            firstName = value;
                          },
                          validator: (value) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "First Name",
                            hintText: "Enter your first name",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        
                        SizedBox(height: 30),
                        TextFormField(
                          onSaved: (newValue) => lastName = newValue,
                          onChanged: (value) {
                            lastName = value;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Last Name",
                            hintText: "Enter your last name",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          onSaved: (newValue) => phoneNumber = newValue,
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          validator: (value) {},
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Phone Number",
                            hintText: "Enter your phone number",
                            // hintTextDirection: Center,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (newValue) => email = newValue,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email",
                            hintText: "Enter your email",
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          // onSaved: (newValue) => birthday = newValue,
                          // onChanged: (value) {},
                          // validator: (value) {},
                          onTap: () => _selectDate(context),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Birthday",
                            // icon: Icons.calendar_today_outlined,
                            hintText: "${selectedDate.toLocal()}".split(' ')[0],
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(height: 30),
                        DropdownButtonFormField(
                          // border: OutlineInputBorder(),
                          items: ['Male', 'Female','Third Gender','Prefer not to say']
                              .map((String category) {
                            return DropdownMenuItem(
                                value: category,
                                child: Row(
                                  children: <Widget>[
                                    Text(category),
                                  ],
                                ));
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() => gender = newValue as String?);
                          },
                          value: gender,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Gender",
                            hintText: "Gender",
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          onSaved: (newValue) => address = newValue,
                          onChanged: (value) {
                            address = value;
                          },
                          validator: (value) {},
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Address",
                            hintText: "Enter your  address",
                            // If  you are using latest version of flutter then lable text and hint text shown like this
                            // if you r using flutter less then 1.20.* then maybe this is not working properly
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        SizedBox(height: 30),
                        DefaultButton(
                          text: "Save",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayDetails(
                                    email: email,
                                    firstname: firstName,
                                    lastname: lastName,
                                    gender: gender,
                                    phoneNumber: phoneNumber,
                                    address: address,
                                    birthday: "${selectedDate.toLocal()}"
                                        .split(' ')[0],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}