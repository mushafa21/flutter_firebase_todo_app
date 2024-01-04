import 'package:base_todolist/ui/dimen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'todo.dart';

class ItemList extends StatelessWidget {
  // dL7AVn1Xcb7Mr5A8Kcmj
  final String transaksiDocId;
  final Todo todo;
  const ItemList({super.key, required this.todo, required this.transaksiDocId});


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    CollectionReference todoCollection = _firestore.collection('Todos');
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    Future<void> deleteTodo() async {
      await _firestore.collection('Todos').doc(transaksiDocId).delete();
    }

    Future<void> updateTodo() async {
      await _firestore.collection('Todos').doc(transaksiDocId).update({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'isComplete': false,
      });
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Update Todo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller:
                  // ignore: unnecessary_null_comparison
                  todo.title == null ? _titleController : _titleController
                    ..text = todo.title,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                SizedBox(height: spacing5,),
                TextField(
                  minLines: 3,
                  maxLines: 5,
                  // ignore: unnecessary_null_comparison
                  controller: todo.description == null
                      ? _descriptionController
                      : _descriptionController
                    ..text = todo.description,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('Batalkan'),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: spacing4,),
              TextButton(
                child: const Text('Update'),
                onPressed: () {
                  updateTodo();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    todo.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    todo.description,
                    style:Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: Icon(
                todo.isComplete
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: todo.isComplete ? Colors.blue : Colors.grey,
              ),
              onPressed: () {
                todoCollection.doc(transaksiDocId).update({
                  'isComplete': !todo.isComplete,
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteTodo();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChecklistButton extends StatefulWidget {
  const ChecklistButton({super.key});

  @override
  State<ChecklistButton> createState() => _ChecklistButtonState();
}

class _ChecklistButtonState extends State<ChecklistButton> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: isChecked ? Colors.blue : Colors.grey,
        size: 25,
      ),
      onPressed: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
    );
  }
}
