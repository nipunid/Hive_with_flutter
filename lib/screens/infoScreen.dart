import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer';
import 'package:localdb_flutter/screens/addProfileScreen.dart';
import 'package:localdb_flutter/screens/addScreen.dart';
import 'package:localdb_flutter/screens/updateScreen.dart';

class FireAddress {
  String city;
  String country;
  String line1;
  String line2;
  String pincode;

  FireAddress({
    required this.city,
    required this.country,
    required this.line1,
    required this.line2,
    required this.pincode,
  });
}

class FireProfile {
  String email;
  String firstName;
  String heading;
  String lastName;
  String phone;
  String photograph;
  String subtitle;
  String website;
  FireAddress address;

  FireProfile({
    required this.email,
    required this.firstName,
    required this.heading,
    required this.lastName,
    required this.phone,
    required this.photograph,
    required this.subtitle,
    required this.website,
    required this.address,
  });
  

}

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late final Box contactBox;

  // Delete info from people box
  _deleteInfo(int index) {
    contactBox.deleteAt(index);
    print('Item deleted from box at index: $index');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box

    contactBox = Hive.box('address');
  }

  void test() async {
    var addressBox = await Hive.openBox('address');
    var profileBox = await Hive.openBox('profile');
    print(addressBox.getAt(0).city);
    print(profileBox.getAt(0).firstName);

    FireAddress fAddress = FireAddress(
        city: addressBox.getAt(0).city, 
        country: addressBox.getAt(0).country,
        line1: addressBox.getAt(0).line1,
        line2: addressBox.getAt(0).line2,
        pincode: addressBox.getAt(0).pincode
        );

    FireProfile fProfile = FireProfile(
        address: fAddress,
        email:profileBox.getAt(0).email,
        firstName:profileBox.getAt(0).firstName,
        heading:profileBox.getAt(0).heading,
        lastName:profileBox.getAt(0).lastName,
        phone:profileBox.getAt(0).phone,
        photograph:profileBox.getAt(0).photograph,
        subtitle:profileBox.getAt(0).subtitle,
        website:profileBox.getAt(0).website,
        );
    print(inspect(fProfile));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
        appBar: AppBar(
          title: const Text('People Info'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          ),
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: const [Text("data")],
        )

        // ValueListenableBuilder(
        //   valueListenable: contactBox.listenable(),
        //   builder: (context, Box box, widget) {
        //     if (box.isEmpty) {
        //       return const Center(
        //         child: Text('Empty'),
        //       );
        //     } else {
        //       return ListView.builder(
        //         itemCount: box.length,
        //         itemBuilder: (context, index) {
        //           var currentBox = box;
        //           var personData = currentBox.getAt(index);
        //           return InkWell(
        //             onTap: () => Navigator.of(context).push(
        //               MaterialPageRoute(
        //                 builder: (context) => UpdateScreen(
        //                   index: index,
        //                   person: personData,
        //                 ),
        //               ),
        //             ),
        //             child: ListTile(
        //               title: Text(personData.firstName),
        //               subtitle: Text(personData.city),
        //               trailing: IconButton(
        //                 onPressed: () => _deleteInfo(index),
        //                 icon: const Icon(
        //                   Icons.delete,
        //                   color: Colors.red,
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}
