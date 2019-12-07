import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/converter/epoch_converter.dart';
import 'package:shadertoy_api/src/converter/value_converter.dart';

part 'info.g.dart';

/// How the content is shared in Shadertoy
enum PublishStatus {
  @JsonValue(0)

  /// Is not shared with anybody
  private,

  @JsonValue(1)

  /// Is visible to anyone who has an embed/iframe or direct link to your published content, but won't show up in the Browse section of the web
  unlisted,

  @JsonValue(2)

  /// Is visible to anyone under the same circumstances as Unlisted, but is also accessible and searchable in the Shadertoy Browse window.
  public,

  @JsonValue(3)

  /// Is like Public content, but can also be accessible to third party applications or services that use Shadertoy's public API.
  public_api
}

@JsonSerializable()

/// Contains the shader meta information
class Info extends Equatable {
  @JsonKey(name: 'id')

  /// The shader id
  final String id;

  @JsonKey(name: 'date')
  @StringEpochInSecondsConverter()

  /// The publish date of the shader
  final DateTime date;

  @JsonKey(name: 'viewed')

  /// The shader views
  final int views;

  @JsonKey(name: 'name')

  /// The shader name
  final String name;

  @JsonKey(name: 'username')

  /// The name of the user that created the shader
  final String userId;

  @JsonKey(name: 'description')

  /// The shader description
  final String description;

  @JsonKey(name: 'likes')

  /// The number of likes
  final int likes;

  @JsonKey(name: 'published')

  /// The publish status
  final PublishStatus publishStatus;

  @JsonKey(name: 'flags')

  /// The shader flags
  final int flags;

  @JsonKey(name: 'tags')

  /// The shader tags
  final List<String> tags;

  @JsonKey(name: 'hasliked')
  @IntToBoolConverter()

  /// If the current logged user liked the shader
  final bool hasLiked;

  /// Builds a [Info]
  ///
  /// * [id]: The shader id
  /// * [date]: The publish date of the shader
  /// * [views]: The shader views
  /// * [name]: The shader name
  /// * [userId]: The id of the user that created the shader
  /// * [description]: The shader description
  /// * [likes]: The number of likes
  /// * [publishStatus]: The publish status
  /// * [flags]: The shader flags
  /// * [tags]: The shader tags
  /// * [hasLiked]: If the current logged user liked the shader
  const Info(
      {this.id,
      this.date,
      this.views,
      this.name,
      this.userId,
      this.description,
      this.likes,
      this.publishStatus,
      this.flags,
      this.tags,
      this.hasLiked});

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [
        id,
        date,
        views,
        name,
        userId,
        description,
        likes,
        publishStatus,
        flags,
        tags,
        hasLiked
      ];

  /// Creates a [Info] from json map
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  /// Creates a json map from a [Info]
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
