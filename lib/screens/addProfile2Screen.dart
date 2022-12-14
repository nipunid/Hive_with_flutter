import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:localdb_flutter/components/addProfile.dart';
import 'package:localdb_flutter/components/my_home_page.dart';

import '../components/addAddressForm.dart';


class AddProfile2Screen extends StatefulWidget {
  @override
  _AddProfile2ScreenState createState() => _AddProfile2ScreenState();
}

class _AddProfile2ScreenState extends State<AddProfile2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Profile2"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Profile2Page(),
      ),
      
    );
  }
}
