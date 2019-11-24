import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'context.g.dart';

/// Maintains a context with Shadertoy related configurations and contant values
///
/// It's provided as a one stop source for contextual information in the Shadertoy clients
@JsonSerializable()
class ShadertoyContext extends Equatable {
  /// The relative path to the shader images previews
  static const String ShaderMediaPath = 'media/shaders';

  /// The relative path to the user image thumbnails
  static const String UserMediaPath = 'media/users';

  /// The relative path to the signin url
  static const String SignInPath = 'signin';

  /// The relative path to the signout url
  static const String SignOutPath = 'signout';

  /// The relative path to the browse url
  static const String BrowsePath = 'browse';

  /// The relative path to the shader view url
  static const String ViewPath = 'view';

  /// The relative path to the img url
  static const String ImgPath = 'img';

  /// The base url of the shadertoy website
  @JsonKey(name: 'baseUrl')
  final String baseUrl;

  /// Builds a Shadertoy context with [baseUrl]
  const ShadertoyContext(this.baseUrl);

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  @override
  List<Object> get props => [baseUrl];

  /// The relative path of the signin url
  String get signInPath {
    return SignInPath;
  }

  /// The signin url
  String get signInUrl {
    return '$baseUrl/${signInPath}';
  }

  /// The relative path of the signout url
  String get signOutPath {
    return SignOutPath;
  }

  /// The signout url
  String get signOutUrl {
    return '$baseUrl/${signOutPath}';
  }

  /// The relative path of the browse url
  String get shaderBrowsePath {
    return BrowsePath;
  }

  /// The browse url
  String get shaderBrowseUrl {
    return '$baseUrl/${shaderBrowsePath}';
  }

  /// The relative path of the shader view url
  String getShaderViewPath(String shaderId) {
    return '${ViewPath}/$shaderId';
  }

  /// The shader view url
  String getShaderViewUrl(String shaderId) {
    return '$baseUrl/${getShaderViewPath(shaderId)}';
  }

  /// The relative path of the shader picture url
  String getShaderPicturePath(String shaderId) {
    return '${ShaderMediaPath}/$shaderId.jpg';
  }

  /// The shader picture url
  String getShaderPictureUrl(String shaderId) {
    return '$baseUrl/${getShaderPicturePath(shaderId)}';
  }

  /// Creates a [ShadertoyContext] out of a json map
  factory ShadertoyContext.fromJson(Map<String, dynamic> json) =>
      _$ShadertoyContextFromJson(json);

  /// Creates a json map from a [ShadertoyContext]
  Map<String, dynamic> toJson() => _$ShadertoyContextToJson(this);
}
