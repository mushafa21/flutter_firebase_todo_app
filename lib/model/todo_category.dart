import 'package:base_todolist/model/todo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_category.g.dart';

@JsonSerializable()
class TodoCategory{
  String? name;
  TodoCategory();

  factory TodoCategory.fromJson(Map<String, dynamic> json) => _$TodoCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$TodoCategoryToJson(this);

}