// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class AppbarBottom extends StatefulWidget {
  const AppbarBottom({Key? key}) : super(key: key);
  @override
  State<AppbarBottom> createState() => _AppbarBottomState();
}

class _AppbarBottomState extends State<AppbarBottom> {
  var isBottomSheetSelect = true;
  FloatingActionButtonLocation floatingActionButtonLocation =
      FloatingActionButtonLocation.centerDocked;
      IconData fabIcon=Icons.add;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  if (isBottomSheetSelect) {
                    isBottomSheetSelect = !isBottomSheetSelect;
                    floatingActionButtonLocation =
                        FloatingActionButtonLocation.miniEndDocked;
                        fabIcon=Icons.share;
                  } else {
                    isBottomSheetSelect = !isBottomSheetSelect;
                    floatingActionButtonLocation =
                        FloatingActionButtonLocation.centerDocked;
                        fabIcon=Icons.add;
                  }
                  setState(() {
                    print(isBottomSheetSelect);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                  child: Text('long press me',
                      style: Theme.of(context).textTheme.headline4),
                ),
              );
            }),
      ),
      bottomNavigationBar: isBottomSheetSelect
          ? customBottomSheet(context)
          : customBottomSheetSelection(context),
      floatingActionButton: fab(fabIcon),
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}

//-----------------start Widget----------------------------------------

Widget customBottomSheet(BuildContext context) {
  return BottomAppBar(
    color: Colors.green,
    elevation: 30,
    notchMargin: 10,
    shape: CircularNotchedRectangle(),
    child: Row(
      children: [
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showFlexibleBottomSheet(
                  minHeight: 0,
                  initHeight: 0.5,
                  maxHeight: 1,
                  anchors: [0, 0.5, 1],
                  context: context,
                  builder: _bottomStickySheet);
            }),
        Spacer(),
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
  );
}

FloatingActionButton fab(IconData icon) {
  return FloatingActionButton(
    // elevation when disabled
    disabledElevation: 10,
    // icon color
    foregroundColor: Colors.white,
    elevation: 30,
    backgroundColor: Colors.red,
    tooltip: 'tooltip',
    child: Icon(icon),
    onPressed: () {},
  );
}

Widget customBottomSheetSelection(BuildContext context) {
  return BottomAppBar(
    color: Colors.green,
    elevation: 30,
    notchMargin: 10,
    shape: CircularNotchedRectangle(),
    child: Row(
      children: [
        IconButton(icon: Icon(Icons.file_download), onPressed: () {}),
        IconButton(icon: Icon(Icons.message), onPressed: () {}),
        IconButton(onPressed: () {}, icon: Icon(Icons.mail)),
        IconButton(icon: Icon(Icons.delete), onPressed: () {}),
      ],
    ),
  );
}

//-----------------end Widget------------------------------------------

// builder for bottom sheet
Widget _bottomStickySheet(BuildContext context,
    ScrollController scrollController, double bottomSheetOffset) {
  {
    return ListView.separated(
        separatorBuilder: (context, index) {
          if (index == 0) {
            return Material(
              child: ListTile(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel)),
                title: Center(child: Text('title')),
              ),
            );
          } else {
            return SizedBox();
          }
        },
        controller: scrollController,
        itemCount: choices.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox();
          }
          return Material(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(choices[index].title[0]),
              ),
              title: Text(choices[index].title),
              trailing: Icon(choices[index].icon),
            ),
          );
        });
  }
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

// data holder class
class Choice {
  Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}
