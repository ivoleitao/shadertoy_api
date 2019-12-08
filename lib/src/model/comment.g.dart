// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
    shaderId: json['shaderId'] as String,
    userId: json['userId'] as String,
    date:
        const StringEpochInSecondsConverter().fromJson(json['date'] as String),
    text: json['text'] as String,
  );
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'shaderId': instance.shaderId,
      'userId': instance.userId,
      'date': const StringEpochInSecondsConverter().toJson(instance.date),
      'text': instance.text,
    };
