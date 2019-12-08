// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    id: json['id'] as String,
    date:
        const StringEpochInSecondsConverter().fromJson(json['date'] as String),
    views: json['viewed'] as int,
    name: json['name'] as String,
    userId: json['username'] as String,
    description: json['description'] as String,
    likes: json['likes'] as int,
    publishStatus:
        _$enumDecodeNullable(_$PublishStatusEnumMap, json['published']),
    flags: json['flags'] as int,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    hasLiked: const IntToBoolConverter().fromJson(json['hasliked'] as int),
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'id': instance.id,
      'date': const StringEpochInSecondsConverter().toJson(instance.date),
      'viewed': instance.views,
      'name': instance.name,
      'username': instance.userId,
      'description': instance.description,
      'likes': instance.likes,
      'published': _$PublishStatusEnumMap[instance.publishStatus],
      'flags': instance.flags,
      'tags': instance.tags,
      'hasliked': const IntToBoolConverter().toJson(instance.hasLiked),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$PublishStatusEnumMap = {
  PublishStatus.private: 0,
  PublishStatus.unlisted: 1,
  PublishStatus.public: 2,
  PublishStatus.public_api: 3,
};
