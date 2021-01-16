// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input _$InputFromJson(Map<String, dynamic> json) {
  return Input(
    id: Input._idFromJson(json['id']),
    src: json['src'] as String,
    type: _$enumDecodeNullable(_$InputTypeEnumMap, json['ctype']),
    channel: json['channel'] as int,
    sampler: json['sampler'] == null
        ? null
        : Sampler.fromJson(json['sampler'] as Map<String, dynamic>),
    published: json['published'] as int,
  );
}

Map<String, dynamic> _$InputToJson(Input instance) => <String, dynamic>{
      'id': instance.id,
      'src': instance.src,
      'ctype': _$InputTypeEnumMap[instance.type],
      'channel': instance.channel,
      'sampler': instance.sampler?.toJson(),
      'published': instance.published,
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

const _$InputTypeEnumMap = {
  InputType.texture: 'texture',
  InputType.volume: 'volume',
  InputType.cubemap: 'cubemap',
  InputType.music: 'music',
  InputType.musicstream: 'musicstream',
  InputType.mic: 'mic',
  InputType.buffer: 'buffer',
  InputType.keyboard: 'keyboard',
  InputType.video: 'video',
  InputType.webcam: 'webcam',
};
