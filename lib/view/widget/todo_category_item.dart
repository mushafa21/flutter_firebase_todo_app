import 'package:base_todolist/model/todo_category.dart';
import 'package:base_todolist/ui/color.dart';
import 'package:base_todolist/view/add_category_page.dart';
import 'package:base_todolist/view/widget/todo_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../model/todo.dart';
import '../../ui/dimen.dart';


class TodoCategoryItem extends StatelessWidget {
  final TodoCategory todoCategory;
  final QueryDocumentSnapshot queryDocumentSnapshot;

  TodoCategoryItem({super.key, required this.todoCategory, required this.queryDocumentSnapshot});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    Future<void> addTodo() {
      return queryDocumentSnapshot.reference.collection("Todos").add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'isComplete': false,
        'uid': _auth.currentUser!.uid,
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => print('Failed to add todo: $error'));
    }

    Future<void> deleteTodoCategory() async {
      await _firestore.collection('TodosCategory').doc(queryDocumentSnapshot.id).delete();
    }



    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCategoryPage(todoCategory: todoCategory,transaksiDocId: queryDocumentSnapshot.id,)));
      },
      child: Container(
        margin: EdgeInsets.all(spacing4),
        padding: EdgeInsets.all(spacing4),
        decoration: BoxDecoration(
          border: Border.all(
            color: gray6Color,
          ),
          borderRadius: BorderRadius.circular(radiusS),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(todoCategory.name ?? "",style: Theme.of(context).textTheme.headlineMedium,),
                Spacer(),
                IconButton(onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Tambah Todo'),
                      content: SizedBox(
                        width: 200,
                        height: 200,
                        child: Column(
                          children: [
                            TextField(
                              controller: _titleController,
                              decoration: InputDecoration(hintText: 'Judul todo'),
                            ),
                            SizedBox(height: spacing4,),
                            TextField(
                              controller: _descriptionController,
                              minLines: 3,
                              maxLines: 5,
                              decoration: InputDecoration(hintText: 'Deskripsi todo'),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Batalkan'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text('Tambah'),
                          onPressed: () {
                            addTodo();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }, icon: Icon(Icons.add)),
                SizedBox(width: spacing6,),
                IconButton(onPressed: (){
                  deleteTodoCategory();
                }, icon: Icon(Icons.delete)),

              ],
            ),
            Divider(),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream:queryDocumentSnapshot.reference.collection("Todos")
                    .snapshots()
                ,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<Todo> listTodo = snapshot.data!.docs.map((document) {
                    return Todo.fromJson(document.data());
                  }).toList();
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listTodo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(
                          todo: listTodo[index],
                          transaksiDocId: snapshot.data!.docs[index].id, categoryDocument: queryDocumentSnapshot,
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
