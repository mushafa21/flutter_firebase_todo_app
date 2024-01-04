// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) => Todo(
      uid: json['uid'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isComplete: json['isComplete'] as bool,
    );

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'description': instance.description,
      'isComplete': instance.isComplete,
    };
