import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://fadcdn.s3.ap-south-1.amazonaws.com/media/449/Lead_Avatar_Boy.jpg";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children:[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Aman Swastik Rath"),
                accountEmail: Text("amanrath477@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),

              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color:Colors.white
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading:Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              leading:Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
