import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'comment.g.dart';

@JsonSerializable()

/// A shader comment
class Comment extends Equatable {
  @JsonKey(name: 'id')

  /// The comment id
  final String id;

  @JsonKey(name: 'userId')

  /// The user who posted the comment
  final String userId;

  @JsonKey(name: 'userPicture')

  /// The picture of the user who posted the comment
  final String userPicture;

  @JsonKey(name: 'date')

  /// The date the comment was posted
  final DateTime date;

  @JsonKey(name: 'text')

  /// The text of the comment
  final String text;

  @JsonKey(name: 'hidden')

  /// If the current user comment is hidden
  final bool hidden;

  /// Builds a [Comment]
  ///
  /// [id]: The id of the comment
  /// [userId]: The user id of user that posted the comment
  /// [userPicture]: The picture of the user who posted the comment
  /// [date]: The date the comment was posted
  /// [text]: The text of the comment
  /// [comment]: If the current user comment is hidden
  const Comment(
      {@required this.id,
      @required this.userId,
      @required this.userPicture,
      @required this.date,
      @required this.text,
      this.hidden = false})
      : assert(id != null),
        assert(userId != null),
        assert(date != null),
        assert(text != null),
        assert(hidden != null);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [id, userId, userPicture, date, text, hidden];

  /// Creates a [Comment] from json map
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  /// Creates a json map from a [Comment]
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  /// Builds a a copy of a [Comment]
  ///
  /// [id]: The id of the comment
  /// [userId]: The user id of user that posted the comment
  /// [userPicture]: The picture of the user who posted the comment
  /// [date]: The date the comment was posted
  /// [text]: The text of the comment
  /// [hidden]: If the current user comment is hidden
  Comment copyWith(
      {String id,
      String userId,
      String userPicture,
      DateTime date,
      String text,
      bool hidden}) {
    return Comment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        userPicture: userPicture ?? this.userPicture,
        date: date ?? this.date,
        text: text ?? this.text,
        hidden: hidden ?? this.hidden);
  }
}
