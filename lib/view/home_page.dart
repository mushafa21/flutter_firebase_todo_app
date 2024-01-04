import 'package:base_todolist/config/locator.dart';
import 'package:base_todolist/config/shared_preference.dart';
import 'package:base_todolist/model/todo_category.dart';
import 'package:base_todolist/view/widget/todo_category_item.dart';
import 'package:base_todolist/view/widget/todo_item.dart';
import 'package:base_todolist/ui/dimen.dart';
import 'package:base_todolist/view/add_category_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/todo.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CacheStore _cacheStore = locator.get();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool isComplete = false;

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


  void cleartext() {
    _titleController.clear();
    _descriptionController.clear();
  }




  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Todo List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:_firestore
                    .collection('TodosCategory')
                    .where('uid', isEqualTo: user!.uid)
                    .snapshots()
                    ,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<TodoCategory> listTodo = snapshot.data!.docs.map((document) {
                    return TodoCategory.fromJson(document.data());
                  }).toList();
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listTodo.length,
                      itemBuilder: (context, index) {
                        return TodoCategoryItem(
                          todoCategory: listTodo[index],
                          queryDocumentSnapshot: snapshot.data!.docs[index],
                        );
                      });
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddCategoryPage()));
        },
        child: Icon(Icons.add),
      ),
    );  }
}
