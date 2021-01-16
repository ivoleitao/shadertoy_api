// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shader _$ShaderFromJson(Map<String, dynamic> json) {
  return Shader(
    version: json['ver'] as String,
    info: json['info'] == null
        ? null
        : Info.fromJson(json['info'] as Map<String, dynamic>),
    renderPasses: (json['renderpass'] as List)
        ?.map((e) =>
            e == null ? null : RenderPass.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ShaderToJson(Shader instance) => <String, dynamic>{
      'ver': instance.version,
      'info': instance.info?.toJson(),
      'renderpass': instance.renderPasses?.map((e) => e?.toJson())?.toList(),
    };
