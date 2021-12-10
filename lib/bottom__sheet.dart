// ignore_for_file: prefer_  _  ructors, prefer_  _  ructors_in_immutables, unnecessary_, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// list of demy data
List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Contact', icon: Icons.contacts),
  Choice(title: 'Map', icon: Icons.map),
  Choice(title: 'Phone', icon: Icons.phone),
  Choice(title: 'Camera', icon: Icons.camera_alt),
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Album', icon: Icons.photo_album),
  Choice(title: 'WiFi', icon: Icons.wifi),
  Choice(title: 'GPS', icon: Icons.gps_fixed),
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom sheet'),
      ),
      body: Column(
        children: [PersistentBottomSheet(), ModelBottomSheet()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

// this is used instead of menus and dialogs
// half screen cover
class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.blue.withOpacity(0.5),
              context: context,
              builder: (BuildContext bc) {
                return ListView.builder(
                    itemCount: choices.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(choices[index].title[0]),
                        ),
                        title: Text(choices[index].title),
                        trailing: Icon(choices[index].icon),
                      );
                    });
              });
       
        },
        child: Text('show model bottom sheet'));
  }
}

//this is used where full screen notification required
// full screen cover
class PersistentBottomSheet extends StatelessWidget {
  const PersistentBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Scaffold.of(context).showBottomSheet(
            (context) {
              return ListView.builder(
                  itemCount: choices.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(choices[index].title[0]),
                      ),
                      title: Text(choices[index].title),
                      trailing: Icon(choices[index].icon),
                    );
                  });
            },
            backgroundColor: Colors.blue.withOpacity(0.5),
          );
        },
        child: Text('show persistent bottom sheet'));
  }
}

// data holder class
class Choice {
  Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}
