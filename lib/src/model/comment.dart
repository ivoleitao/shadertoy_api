import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/converter/epoch_converter.dart';

part 'comment.g.dart';

@JsonSerializable()

/// A shader comment
class Comment extends Equatable {
  @JsonKey(name: 'shaderId')

  /// The shader id of the target Shader
  final String shaderId;

  @JsonKey(name: 'userId')

  /// The user who posted the comment
  final String userId;

  @StringEpochInSecondsConverter()
  @JsonKey(name: 'date')

  /// The date the comment was posted
  final DateTime date;

  @JsonKey(name: 'text')

  /// The text of the comment
  final String text;

  /// Builds a comment
  ///
  /// [shaderId]: The id of the shader
  /// [userId]: The user id of user that posted the comment
  /// [date]: The date the comment was posted
  /// [text]: The text of the comment
  const Comment({this.shaderId, this.userId, this.date, this.text});

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [shaderId, userId, date, text];

  /// Creates a [Comment] from json map
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// Creates a json map from a [Comment]
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
