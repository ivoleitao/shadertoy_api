import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()

/// A shadertoy site user
class User extends Equatable {
  @JsonKey(name: 'id')

  /// The id of the user
  final String id;

  @JsonKey(name: 'picture')

  /// A link to the user picture
  final String picture;

  @JsonKey(name: 'memberSince')

  /// Join date of the user
  final DateTime memberSince;

  @JsonKey(name: 'shaders')

  /// How many shaders the user contributed
  final int shaders;

  @JsonKey(name: 'comments')

  /// How many comments the user contributed
  final int comments;

  @JsonKey(name: 'about')

  /// More about the user
  final String about;

  /// Builds a user
  ///
  /// * [id]: The id of the user
  /// * [picture]: A link to the user picture
  /// * [memberSince]: The user join date
  /// * [shaders]: The number of shaders
  /// * [comments]: The number of comments
  /// * [about]: More about the user
  const User(
      {@required this.id,
      this.picture,
      @required this.memberSince,
      this.shaders = 0,
      this.comments = 0,
      this.about})
      : assert(id != null),
        assert(memberSince != null),
        assert(shaders != null),
        assert(comments != null);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props =>
      [id, picture, memberSince, shaders, comments, about];

  /// Creates a [User] from json map
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates a json map from a [User]
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
