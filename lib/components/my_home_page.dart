import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_flutter/components/my_home_page.dart';
import 'package:localdb_flutter/model/address.dart';
import 'package:localdb_flutter/model/people.dart';
import 'package:localdb_flutter/model/person.dart';
import 'package:localdb_flutter/model/profile.dart';
import 'package:localdb_flutter/screens/infoScreen.dart';

class Profile2Page extends StatefulWidget {
  const Profile2Page({
    Key? key,
  }) : super(key: key);

  @override
  _Profile2PageState createState() => _Profile2PageState();
}

class _Profile2PageState extends State<Profile2Page> {
  late final Box box;

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _headingController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNameController = TextEditingController();
  final _photographController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _websiteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void initState() async {
  //   super.initState();
  //   // Get reference to an already opened box
  //  var profilebox  = await Hive.openBox('profile');

  // }

  void test() async {
    // var addressBox = await Hive.openBox('address');
    var profileBox = await Hive.openBox('profile');
    // print(profileBox.putAt(0, _phoneNameController.text));
    print(profileBox.values);

    profileBox.putAt(profileBox.values.length - 1, {
       "email": profileBox.getAt(profileBox.values.length - 1).email,
      "firstName": profileBox.getAt(profileBox.values.length - 1).firstName,
      "heading": profileBox.getAt(profileBox.values.length - 1).heading,
      "lastName": profileBox.getAt(profileBox.values.length - 1).lastName,
      "phone": _phoneNameController.text,
      "photograph": _photographController.text,
      "subtitle": _subtitleController.text,
      "website": _websiteController.text
    });
    // print('object');
    // profileBox.put("photograph", _photographController.text);
    // print('object2');
    //profileBox.put("subtitle", _subtitleController.text);

    //print('object4');

    //profileBox.put("website", _websiteController.text);
    print(inspect(profileBox.values));

    // Profile newProfile = Profile(
    //   email: '',
    //   firstName: '',
    //   heading: '',
    //   lastName: '',
    //   phone: _phoneNameController.text,
    //   photograph:_photographController.text,
    //   subtitle: _subtitleController.text,
    //   website: _websiteController.text);

    // profileBox.putAll("phone":_phoneNameController.text,
    //     "photograph":_photographController.text,
    //     "subtitle": _subtitleController.text,
    //     "website": _websiteController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' phone'),
          TextFormField(
            controller: _phoneNameController,
            //validator: _fieldValidator,
          ),
          Text('photo'),
          TextFormField(
            controller: _photographController,
            //validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('subtitle'),
          TextFormField(
            controller: _subtitleController,
            //validator: _fieldValidator,
          ),
          SizedBox(height: 24.0),
          Text('website'),
          TextFormField(
            controller: _websiteController,
            //validator: _fieldValidator,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  //_addInfo();
                  test();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoScreen()),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // _addInfo() async {

  //   Profile profileBox = Profile(
  //       email: box.get('profile').email,
  //       firstName: box.get('profile').firstName,
  //       heading: box.get('profile').heading,
  //       lastName:  box.get('profile').lastName,
  //       phone: _phoneNameController.text,
  //       photograph: _photographController.text,
  //       subtitle: _subtitleController.text,
  //       website: _websiteController.text);

  //   profileBox.add(profileBox);
  //   //print(profileBox);
  // }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
//}