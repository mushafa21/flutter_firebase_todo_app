import 'package:base_todolist/ui/dimen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../config/locator.dart';
import '../config/shared_preference.dart';
import 'login_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CacheStore _cacheStore = locator.get();


  Future<void> _signOut() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Logout'),
        content: Text('Apakah anda yakin ingin logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: () async {
              await _auth.signOut();
              _cacheStore.setLogin(false);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
            },
            child: Text('Ya'),
          ),
        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                _signOut();
              }, child: Text("Logout"),style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error
              ),),
            )

          ],
        ),
      ),
    );
  }
}
