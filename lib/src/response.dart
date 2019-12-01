import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shadertoy_api/src/converter/error_converter.dart';
import 'package:shadertoy_api/src/model/comment.dart';
import 'package:shadertoy_api/src/model/playlist.dart';
import 'package:shadertoy_api/src/model/shader.dart';

import 'model/account.dart';
import 'model/user.dart';

part 'response.g.dart';

/// The list of errors
enum ErrorCode {
  /// Authentication error
  AUTHENTICATION,

  /// Authorization error
  AUTHORIZATION,

  /// Backend timeout error
  BACKEND_TIMEOUT,

  /// Backend status error
  BACKEND_STATUS,

  /// Invalid backend response error
  BACKEND_RESPONSE,

  /// Not found error
  NOT_FOUND,

  /// Operation aborted error
  ABORTED,

  /// Unknowkn error
  UNKNOWN
}

/// Error information class
///
/// Provides details of an error after the execution of an API call. It should be instantiated in every
/// response object when there is an error of some sort during the execution. All the API responses should
/// return a class extending [APIResponse] which stores in [APIResponse.error] and instance of [ResponseError]
class ResponseError with EquatableMixin {
  /// The error code
  ErrorCode code;

  /// The error message
  String message;

  /// The context of execution when the error occurred
  String context;

  /// The target entity of the API that triggered this error
  String target;

  /// Builds a [ResponseError] with:
  ///
  /// * [code]: The error code
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError({this.code, this.message, this.context, this.target});

  /// Builds a authentication [ResponseError] with [ErrorCode.AUTHENTICATION] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.authentication({String message, String context, String target})
      : this(
            code: ErrorCode.AUTHENTICATION,
            message: message,
            context: context,
            target: target);

  /// Builds a authorization [ResponseError] with [ErrorCode.AUTHORIZATION] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.authorization({String message, String context, String target})
      : this(
            code: ErrorCode.AUTHORIZATION,
            message: message,
            context: context,
            target: target);

  /// Builds a backend timeout [ResponseError] with [ErrorCode.BACKEND_TIMEOUT] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.backendTimeout({String message, String context, String target})
      : this(
            code: ErrorCode.BACKEND_TIMEOUT,
            message: message,
            context: context,
            target: target);

  /// Builds a backend status [ResponseError] with [ErrorCode.BACKEND_STATUS] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.backendStatus({String message, String context, String target})
      : this(
            code: ErrorCode.BACKEND_STATUS,
            message: message,
            context: context,
            target: target);

  /// Builds a backend response [ResponseError] with [ErrorCode.BACKEND_RESPONSE] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.backendResponse({String message, String context, String target})
      : this(
            code: ErrorCode.BACKEND_RESPONSE,
            message: message,
            context: context,
            target: target);

  /// Builds a not found [ResponseError] with [ErrorCode.NOT_FOUND] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.notFound({String message, String context, String target})
      : this(
            code: ErrorCode.NOT_FOUND,
            message: message,
            context: context,
            target: target);

  /// Builds a aborted [ResponseError] with [ErrorCode.ABORTED] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.aborted({String message, String context, String target})
      : this(
            code: ErrorCode.ABORTED,
            message: message,
            context: context,
            target: target);

  /// Builds a unknown [ResponseError] with [ErrorCode.UNKNOWN] and:
  ///
  /// * [message]: The error message
  /// * [context]: The context of execution when the error ocurred
  /// * [target]: The target entity of the API that triggered this error
  ResponseError.unknown({String message, String context, String target})
      : this(
            code: ErrorCode.UNKNOWN,
            message: message,
            context: context,
            target: target);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List<Object> get props => [code, message, context, target];

  /// Creates a json map from a [ResponseError]
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code?.toString()?.split('.')?.last,
        'message': message,
        'context': context,
        'target': target
      };
}

/// Base API response class
///
/// It should be used as the base class for every API response. It provides support for
/// error aware responses with a field that should be set when there was an error in
/// the API
abstract class APIResponse {
  @JsonKey(name: 'Error')
  @ResponseErrorConverter()

  /// The error
  final ResponseError error;

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [error];
  }

  /// Builds an [APIResponse]
  ///
  /// An optional [error] can be provided
  APIResponse({this.error});

  /// Checks if the response has an error
  ///
  /// Simply check if [error] is not null
  bool hasError() {
    return this.error != null;
  }
}

@JsonSerializable()

/// Login API response
///
/// The response returned upon the execution of a login in the Shadertoy website
/// When [LoginResponse.error] is *not null* there was an error in the login process
/// When [LoginResponse.error] is *null* the login was sucessfull
class LoginResponse extends APIResponse with EquatableMixin {
  /// Builds an [LoginResponse]
  ///
  /// An optional [error] can be provided
  LoginResponse({ResponseError error}) : super(error: error);

  /// Creates a [LoginResponse] from json map
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  /// Creates a json map from a [LoginResponse]
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()

/// Logout API response
///
/// The response returned upon the execution of a logout in the Shadertoy website
/// When [LogoutResponse.error] is *not null* there was an error in the logout process
/// When [LogoutResponse.error] is *null* the logout was sucessfull
class LogoutResponse extends APIResponse with EquatableMixin {
  /// Builds an [LogoutResponse]
  ///
  /// An optional [error] can be provided
  LogoutResponse({ResponseError error}) : super(error: error);

  /// Creates a [LogoutResponse] from json map
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  /// Creates a json map from a [LogoutResponse]
  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}

@JsonSerializable()

/// Find shader API response
///
/// The response returned upon the execution of a find shader API call
/// When [FindShaderResponse.error] is *not null* there was an error in the find shader call
/// When [FindShaderResponse.error] is *null* the [FindShaderResponse.shader] has the returned shader
class FindShaderResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Shader')

  /// The shader returned, null when there is an error
  final Shader shader;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [shader, error];
  }

  /// Builds an [FindShaderResponse]
  ///
  /// * [shader]: The shader
  /// * [error]: An error
  ///
  /// Upon construction either [shader] or [error] should be provided, not both
  FindShaderResponse({this.shader, ResponseError error}) : super(error: error);

  /// Creates a [FindShaderResponse] from json map
  factory FindShaderResponse.fromJson(Map<String, dynamic> json) =>
      _$FindShaderResponseFromJson(json);

  /// Creates a json map from a [FindShaderResponse]
  Map<String, dynamic> toJson() => _$FindShaderResponseToJson(this);
}

@JsonSerializable()

/// Comments response
///
/// The response returned from a call to the Shadertoy comments endpoint
/// When [CommentsResponse.error] is *not null* there was an error while fetching the comments
/// When [CommentsResponse.error] is *null* the [CommentsResponse] has a individual list of
/// text, date, username and userpicture all with the same size. The first index of
/// of the text list corresponds to the first index of the date list and so on. This is a structure
/// used for the intermediary storage of the response. It is transformed in [FindCommentsResponse] later
class CommentsResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'text')

  /// The list of comment texts
  final List<String> text;

  @JsonKey(name: 'date')

  /// The list of date for each comment
  final List<String> date;

  @JsonKey(name: 'username')

  /// The list of user's that posted the comment
  final List<String> userName;

  @JsonKey(name: 'userpicture')

  /// The list of user pictures for each comment
  final List<String> userPicture;

  /// Builds a [CommentsResponse]
  ///
  /// [text]: The list of text comments
  /// [date]: The list of dates for each comment
  /// [userName]: The list of user for each comment
  /// [userPicture]: The list user pictures for each comment
  /// [error]: An error if there was error while fetching the comments
  CommentsResponse(
      {this.text,
      this.date,
      this.userName,
      this.userPicture,
      ResponseError error})
      : super(error: error);

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [text, date, userName, userPicture, error];
  }

  /// Creates a [CommentsResponse] from json list
  factory CommentsResponse.fromList(List<dynamic> json) => CommentsResponse(
      text: const [],
      date: const [],
      userName: const [],
      userPicture: const []);

  /// Creates a [CommentsResponse] from json map
  factory CommentsResponse.fromMap(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);

  /// Creates a [CommentsResponse] from json list or map
  factory CommentsResponse.from(dynamic data) => data is List
      ? CommentsResponse.fromList(data)
      : CommentsResponse.fromMap(data);

  /// Creates a json map from a [CommentsResponse]
  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}

@JsonSerializable()

/// Find user API response
///
/// The response returned upon the execution of a find user API call
/// When [FindUserResponse.error] is *not null* there was an error in the find user call
/// When [FindUserResponse.error] is *null* the [FindUserResponse.user] has the returned user
class FindUserResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'User')

  /// The user returned, null when there is an error
  final User user;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [user, error];
  }

  /// Builds a [FindUserResponse]
  ///
  /// [user]: The user
  /// [error]: An error if there was error while fetching the user
  FindUserResponse({this.user, ResponseError error}) : super(error: error);

  /// Creates a [FindUserResponse] from json map
  factory FindUserResponse.fromJson(Map<String, dynamic> json) =>
      _$FindUserResponseFromJson(json);

  /// Creates a json map from a [FindUserResponse]
  Map<String, dynamic> toJson() => _$FindUserResponseToJson(this);
}

@JsonSerializable()

/// Find account API response
///
/// The response returned upon the execution of a find account API call
/// When [FindAccountResponse.error] is *not null* there was an error in the find account call
/// When [FindAccountResponse.error] is *null* the [FindAccountResponse.account] has the returned account
class FindAccountResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Account')

  /// The account returned, null when there is an error
  final Account account;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [account, error];
  }

  /// Builds a [FindAccountResponse]
  ///
  /// [account]: The account
  /// [error]: An error if there was error while fetching the account
  FindAccountResponse({this.account, ResponseError error})
      : super(error: error);

  /// Creates a [FindAccountResponse] from json map
  factory FindAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$FindAccountResponseFromJson(json);

  /// Creates a json map from a [FindAccountResponse]
  Map<String, dynamic> toJson() => _$FindAccountResponseToJson(this);
}

@JsonSerializable()

/// Find accounts API response
///
/// The response returned upon the execution of a find accounts API call
/// When [FindAccountsResponse.error] is *not null* there was an error in the find accounts call
/// When [FindAccountsResponse.error] is *null* the [FindAccountsResponse.accounts] has the returned accounts
class FindAccountsResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Accounts')

  /// The list of returned account or null when error
  final List<FindAccountResponse> accounts;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [accounts, error];
  }

  /// Builds a [FindAccountsResponse]
  ///
  /// [accounts]: The list of accounts
  /// [error]: An error if there was error while fetching the accounts
  FindAccountsResponse({this.accounts, ResponseError error})
      : super(error: error);

  /// Creates a [FindAccountsResponse] from json map
  factory FindAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$FindAccountsResponseFromJson(json);

  /// Creates a json map from a [FindAccountsResponse]
  Map<String, dynamic> toJson() => _$FindAccountsResponseToJson(this);
}

@JsonSerializable()

/// Find comments API response
///
/// The response returned upon the execution of a find comments API call
/// When [FindCommentsResponse.error] is *not null* there was an error in the find accounts call
/// When [FindCommentsResponse.error] is *null* the [FindCommentsResponse.comments] has the returned accounts
class FindCommentsResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Comments')

  /// The total number of comments
  final int total;

  @JsonKey(name: 'Results')

  /// The list of [Comment] returned
  final List<Comment> comments;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [total, comments, error];
  }

  /// Builds a [FindAccountsResponse]
  ///
  /// [total]: The total number of comments returned
  /// [comments]: The list of [Comment]
  /// [error]: An error if there was error while fetching the comments
  FindCommentsResponse({int total, this.comments, ResponseError error})
      : total = total ?? comments?.length,
        super(error: error);

  /// Creates a [FindCommentsResponse] from json map
  factory FindCommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$FindCommentsResponseFromJson(json);

  /// Creates a json map from a [FindCommentsResponse]
  Map<String, dynamic> toJson() => _$FindCommentsResponseToJson(this);
}

@JsonSerializable()

/// Find playlist API response
///
/// The response returned upon the execution of a find playlist API call
/// When [FindPlaylistResponse.error] is *not null* there was an error in the find account call
/// When [FindPlaylistResponse.error] is *null* the [FindPlaylistResponse.playlist] has the returned playlist
class FindPlaylistResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Playlist')

  /// The playlist returned, null when there is an error
  final Playlist playlist;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [playlist, error];
  }

  /// Builds a [FindPlaylistResponse]
  ///
  /// [playlist]: The playlist
  /// [error]: An error if there was error while fetching the playlist
  FindPlaylistResponse({this.playlist, ResponseError error})
      : super(error: error);

  /// Creates a [FindPlaylistResponse] from json map
  factory FindPlaylistResponse.fromJson(Map<String, dynamic> json) =>
      _$FindPlaylistResponseFromJson(json);

  /// Creates a json map from a [FindPlaylistResponse]
  Map<String, dynamic> toJson() => _$FindPlaylistResponseToJson(this);
}

@JsonSerializable()

/// Find shader ids API response
///
/// The response returned upon the execution of a find shader ids API call
/// When [FindShaderIdsResponse.error] is *not null* there was an error in the find shader ids call
/// When [FindShaderIdsResponse.error] is *null* the [FindShaderIdsResponse.ids] has the returned shader ids
class FindShaderIdsResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Shaders')

  /// The total number of shader ids
  final int total;

  @JsonKey(name: 'Results')

  /// The list of shader ids returned
  final List<String> ids;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [total, ids, error];
  }

  /// Builds a [FindShaderIdsResponse]
  ///
  /// [total]: The total number of shader ids returned
  /// [ids]: The list of ids
  /// [error]: An error if there was error while fetching the shader ids
  FindShaderIdsResponse({int count, this.ids, ResponseError error})
      : total = count ?? ids?.length,
        super(error: error);

  /// Creates a [FindShaderIdsResponse] from json map
  factory FindShaderIdsResponse.fromJson(Map<String, dynamic> json) =>
      _$FindShaderIdsResponseFromJson(json);

  /// Creates a json map from a [FindShaderIdsResponse]
  Map<String, dynamic> toJson() => _$FindShaderIdsResponseToJson(this);
}

@JsonSerializable()

/// Find shaders API response
///
/// The response returned upon the execution of a find shaders API call
/// When [FindShadersResponse.error] is *not null* there was an error in the find shaders call
/// When [FindShadersResponse.error] is *null* the [FindShadersResponse.shaders] has the returned shaders
class FindShadersResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Shaders')

  /// The total number of shaders
  final int total;

  @JsonKey(name: 'Results')

  /// The list of the shaders returned
  final List<FindShaderResponse> shaders;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [total, shaders, error];
  }

  /// Builds a [FindShadersResponse]
  ///
  /// [total]: The total number of shader returned
  /// [shaders]: The list of shaders
  /// [error]: An error if there was error while fetching the shaders
  FindShadersResponse({int total, this.shaders, ResponseError error})
      : total = total ?? shaders?.length,
        super(error: error);

  /// Creates a [FindShadersResponse] from json map
  factory FindShadersResponse.fromJson(Map<String, dynamic> json) =>
      _$FindShadersResponseFromJson(json);

  /// Creates a json map from a [FindShadersResponse]
  Map<String, dynamic> toJson() => _$FindShadersResponseToJson(this);
}

/// Download file API response
///
/// The response returned upon the execution of the download file API call
/// When [DownloadFileResponse.error] is *not null* there was an error in the donwload file call
/// When [DownloadFileResponse.error] is *null* the [DownloadFileResponse.bytes] has the bytes of the file
class DownloadFileResponse extends APIResponse with EquatableMixin {
  @JsonKey(name: 'Bytes')

  /// File bytes
  final List<int> bytes;

  @override

  /// The [List] of `props` (properties) which will be used to determine whether
  /// two [Equatables] are equal.
  List get props {
    return [bytes, error];
  }

  /// Builds a [DownloadFileResponse]
  ///
  /// [bytes]: The bytes of the file
  /// [error]: An error if there was error while fetching the file
  DownloadFileResponse({this.bytes, ResponseError error}) : super(error: error);
}

/// Save user API response
///
/// The response returned upon the execution of the save user API call
/// When [SaveUserResponse.error] is *not null* there was an error in the save user call
/// When [SaveUserResponse.error] is *null* the save was sucessful
class SaveUserResponse extends APIResponse with EquatableMixin {
  /// Builds a [SaveUserResponse]
  ///
  /// [error]: An error if there was error while saving the user
  SaveUserResponse({ResponseError error}) : super(error: error);
}

/// Save account API response
///
/// The response returned upon the execution of the save account API call
/// When [SaveAccountResponse.error] is *not null* there was an error in the save account call
/// When [SaveAccountResponse.error] is *null* the save was sucessful
class SaveAccountResponse extends APIResponse with EquatableMixin {
  /// Builds a [SaveAccountResponse]
  ///
  /// [error]: An error if there was error while saving the account
  SaveAccountResponse({ResponseError error}) : super(error: error);
}

/// Save shader API response
///
/// The response returned upon the execution of the save shader API call
/// When [SaveShaderResponse.error] is *not null* there was an error in the save shader call
/// When [SaveShaderResponse.error] is *null* the save was sucessful
class SaveShaderResponse extends APIResponse with EquatableMixin {
  /// Builds a [SaveShaderResponse]
  ///
  /// [error]: An error if there was error while saving the shader
  SaveShaderResponse({ResponseError error}) : super(error: error);
}

/// Save shader comments API response
///
/// The response returned upon the execution of the save shader comments API call
/// When [SaveShaderCommentsResponse.error] is *not null* there was an error in the save shader comments call
/// When [SaveShaderCommentsResponse.error] is *null* the save was sucessful
class SaveShaderCommentsResponse extends APIResponse with EquatableMixin {
  /// Builds a [SaveShaderCommentsResponse]
  ///
  /// [error]: An error if there was error while saving the shader comments
  SaveShaderCommentsResponse({ResponseError error}) : super(error: error);
}

/// Save playlist API response
///
/// The response returned upon the execution of the save playlist API call
/// When [SavePlaylistResponse.error] is *not null* there was an error in the save playlist call
/// When [SavePlaylistResponse.error] is *null* the save was sucessful
class SavePlaylistResponse extends APIResponse with EquatableMixin {
  /// Builds a [SavePlaylistResponse]
  ///
  /// [error]: An error if there was error while saving the playlist
  SavePlaylistResponse({ResponseError error}) : super(error: error);
}
