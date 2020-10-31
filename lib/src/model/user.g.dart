// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    picture: json['picture'] as String,
    memberSince: json['memberSince'] == null
        ? null
        : DateTime.parse(json['memberSince'] as String),
    shaders: json['shaders'] as int,
    comments: json['comments'] as int,
    following: json['following'] as int,
    followers: json['followers'] as int,
    about: json['about'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'memberSince': instance.memberSince?.toIso8601String(),
      'shaders': instance.shaders,
      'comments': instance.comments,
      'following': instance.following,
      'followers': instance.followers,
      'about': instance.about,
    };
