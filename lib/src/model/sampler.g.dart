// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sampler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sampler _$SamplerFromJson(Map<String, dynamic> json) {
  return Sampler(
    filter: _$enumDecodeNullable(_$FilterTypeEnumMap, json['filter']),
    wrap: _$enumDecodeNullable(_$WrapTypeEnumMap, json['wrap']),
    vflip: const StringToBoolConverter().fromJson(json['vflip'] as String),
    srgb: const StringToBoolConverter().fromJson(json['srgb'] as String),
    internal: json['internal'] as String,
  );
}

Map<String, dynamic> _$SamplerToJson(Sampler instance) => <String, dynamic>{
      'filter': _$FilterTypeEnumMap[instance.filter],
      'wrap': _$WrapTypeEnumMap[instance.wrap],
      'vflip': const StringToBoolConverter().toJson(instance.vflip),
      'srgb': const StringToBoolConverter().toJson(instance.srgb),
      'internal': instance.internal,
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

const _$FilterTypeEnumMap = {
  FilterType.none: 'none',
  FilterType.nearest: 'nearest',
  FilterType.linear: 'linear',
  FilterType.mipmap: 'mipmap',
};

const _$WrapTypeEnumMap = {
  WrapType.none: 'none',
  WrapType.clamp: 'clamp',
  WrapType.repeat: 'repeat',
  WrapType.mirror: 'mirror',
};
