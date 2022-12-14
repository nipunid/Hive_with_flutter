import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_flutter/components/my_home_page.dart';
import 'package:localdb_flutter/model/address.dart';
import 'package:localdb_flutter/model/people.dart';
import 'package:localdb_flutter/model/person.dart';
import 'package:localdb_flutter/model/profile.dart';
import 'package:localdb_flutter/screens/addProfile2Screen.dart';
import 'package:localdb_flutter/screens/infoScreen.dart';

class AddProfileForm extends StatefulWidget {
  const AddProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  _AddProfileFormState createState() => _AddProfileFormState();
}

class _AddProfileFormState extends State<AddProfileForm> {
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
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('profile');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' Email'),
          TextFormField(
            controller: _emailController,
            validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
          ),
          Text('FirstName'),
          TextFormField(
            controller: _firstNameController,
           validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
          ),
          SizedBox(height: 24.0),
          Text('heading'),
          TextFormField(
            controller: _headingController,
            validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
          ),
          SizedBox(height: 24.0),
          Text('LastName'),
          TextFormField(
            controller: _lastNameController,
           validator: (value) {
          if (value!.isEmpty || !value.contains('@')) {
            return 'Please enter a valid email address';
          }
          return null;
        },
          ),
         
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: Container(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  _addInfo();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  AddProfile2Screen()),
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

  _addInfo() async {
    Profile newProfile = Profile(
        email: _emailController.text,
        firstName: _firstNameController.text,
        heading: _headingController.text,
        lastName: _lastNameController.text,
        phone: '',
        photograph:'',
        subtitle: '',
        website: '');

    box.add(newProfile);
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }
}
