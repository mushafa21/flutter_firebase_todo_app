import 'package:base_todolist/model/todo_category.dart';
import 'package:base_todolist/ui/color.dart';
import 'package:base_todolist/ui/dimen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddCategoryPage extends StatelessWidget {
  final TodoCategory? todoCategory;
  final String? transaksiDocId;
  AddCategoryPage({super.key, this.todoCategory, this.transaksiDocId});

  final TextEditingController _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;




  @override
  Widget build(BuildContext context) {
    _nameController.text = todoCategory?.name ?? "";
    CollectionReference todoCollection = _firestore.collection('TodosCategory');

    Future<void> updateCategory() {
      return todoCollection.doc(transaksiDocId).update(({
        'name': _nameController.text,
      }));
    }

    Future<void> addTodoCategory() {
      return todoCollection.add({
        'name': _nameController.text,
        'uid': _auth.currentUser!.uid,
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => print('Failed to add todo: $error'));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Kategori Todo",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onBackground),),),
      body: SafeArea(child: Padding(padding: EdgeInsets.all(paddingLarge),child: Column(
        children: [

          TextField(
            decoration: InputDecoration(
              labelText: "Nama Kategori"
            ),
            controller: _nameController,
          ),
          SizedBox(height: spacing5,),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () async{
              if(_nameController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Nama Tidak Boleh Kosong")));
              } else{
                if(transaksiDocId != null){
                  await updateCategory();
                  Navigator.of(context).pop();
                } else{
                  await addTodoCategory();
                  Navigator.of(context).pop();
                }

              }

            }, child: Text(transaksiDocId != null ? "Edit Kategori" :"Tambah Kategori")),
          )

        ],
      ),)),
    );
  }
}


