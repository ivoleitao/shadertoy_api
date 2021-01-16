// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'render_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenderPass _$RenderPassFromJson(Map<String, dynamic> json) {
  return RenderPass(
    name: json['name'] as String,
    type: _$enumDecodeNullable(_$RenderPassTypeEnumMap, json['type']),
    description: json['description'] as String,
    code: json['code'] as String,
    inputs: (json['inputs'] as List)
        ?.map(
            (e) => e == null ? null : Input.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputs: (json['outputs'] as List)
        ?.map((e) =>
            e == null ? null : Output.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RenderPassToJson(RenderPass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$RenderPassTypeEnumMap[instance.type],
      'description': instance.description,
      'code': instance.code,
      'inputs': instance.inputs?.map((e) => e?.toJson())?.toList(),
      'outputs': instance.outputs?.map((e) => e?.toJson())?.toList(),
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

const _$RenderPassTypeEnumMap = {
  RenderPassType.sound: 'sound',
  RenderPassType.common: 'common',
  RenderPassType.image: 'image',
  RenderPassType.buffer: 'buffer',
  RenderPassType.cubemap: 'cubemap',
};
