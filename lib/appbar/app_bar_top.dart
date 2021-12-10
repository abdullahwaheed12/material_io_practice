// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AppBarTop extends StatefulWidget {
  const AppBarTop({Key? key}) : super(key: key);

  @override
  State<AppBarTop> createState() => _AppBarTopState();
}

class _AppBarTopState extends State<AppBarTop> {
  var nameList = ['abdullah', 'ali', 'hamza', 'usama', 'nabeel'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
      ),
      body: ListView.builder(
          itemCount: nameList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onLongPress: () {},
              leading: CircleAvatar(
                child: Text(nameList[index][0]),
              ),
              title: Text(nameList[index]),
            );
          }),
    );
  }
}
