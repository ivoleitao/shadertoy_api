// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    shaderId: json['shaderId'] as String,
    userId: json['userId'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'shaderId': instance.shaderId,
      'userId': instance.userId,
      'date': instance.date?.toIso8601String(),
      'text': instance.text,
    };
