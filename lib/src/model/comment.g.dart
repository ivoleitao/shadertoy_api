// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    id: json['id'] as String,
    userId: json['userId'] as String,
    userPicture: json['userPicture'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    text: json['text'] as String,
    hidden: json['hidden'] as bool,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userPicture': instance.userPicture,
      'date': instance.date?.toIso8601String(),
      'text': instance.text,
      'hidden': instance.hidden,
    };
