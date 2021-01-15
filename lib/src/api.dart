import 'package:meta/meta.dart';
import 'package:shadertoy_api/src/context.dart';
import 'package:shadertoy_api/src/model/comment.dart';
import 'package:shadertoy_api/src/model/playlist.dart';
import 'package:shadertoy_api/src/model/shader.dart';
import 'package:shadertoy_api/src/model/user.dart';
import 'package:shadertoy_api/src/response.dart';

/// The supported sort orders
enum Sort {
  /// Sort by name
  name,

  /// Sort by likes
  love,

  /// Sort by views
  popular,

  /// Sort by newest
  newest,

  /// Sort is proportional to the populary and
  /// inversly proportional to lifetime
  hot
}

/// Account context
const CONTEXT_ACCOUNT = 'account';

/// User context
const CONTEXT_USER = 'user';

/// Shader context
const CONTEXT_SHADER = 'shader';

/// Comment context
const CONTEXT_COMMENT = 'comment';

/// Playlist context
const CONTEXT_PLAYLIST = 'playlist';

/// The exception handling mode
enum ErrorMode {
  /// The errors should be handled and returned on the response error
  HandleAndReturn,

  /// The errors should be handled and returned on retrown
  HandleAndRetrow
}

/// Base class for the client options
///
/// It provides a number of options that can be configured regardless the specific implementation
abstract class ShadertoyClientOptions {
  /// The default error handling mode
  static const ErrorMode DefaultErrorHandling = ErrorMode.HandleAndReturn;

  /// The selected error handling mode
  final ErrorMode errorHandling;

  /// Builds a [ShadertoyClientOptions]
  ///
  /// * [errorHandling]: The error handling mode
  ShadertoyClientOptions({@required this.errorHandling})
      : assert(errorHandling != null);
}

/// Base shadertoy client API
///
/// All the basic operations supported through
/// the Shadertoy REST API.
abstract class ShadertoyClient {
  /// Catches and handles a specific type of error in a future
  ///
  /// * [future]: The future
  /// * [handle]: The error handling function
  static Future<R> catchError<R extends APIResponse, E>(
      Future<R> future, R Function(E) handle, ErrorMode errorMode) {
    return future.catchError((e) {
      if (e is E) {
        final apiResponse = handle(e);
        if (errorMode == ErrorMode.HandleAndReturn) {
          return Future.value(apiResponse);
        } else if (errorMode == ErrorMode.HandleAndRetrow) {
          return Future.error(apiResponse.error);
        }
      }
      return Future.error(e);
    });
  }

  /// Returns a [FindShaderResponse] for the shader with [shaderId]
  ///
  /// Upon success a [Shader] object is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Shader] is provided
  Future<FindShaderResponse> findShaderById(String shaderId);

  /// Returns a [FindShadersResponse] for each shader id in [shaderIds]
  ///
  /// Upon success a list of [Shader] objects is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Shader] list is provided
  Future<FindShadersResponse> findShadersByIdSet(Set<String> shaderIds);

  /// Returns a filtered [FindShadersResponse] with a list of shaders
  ///
  /// * [term]: Shaders that have [term] in the name or in description
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of [Shader] objects is provided as well as the overall
  /// number of records in total (not the number of shaders in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Shader] list is provided
  Future<FindShadersResponse> findShaders(
      {String term, Set<String> filters, Sort sort, int from, int num});

  /// Returns a [FindShaderIdsResponse] with all the shader id's
  ///
  /// Upon success a list of shader ids is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is provided
  Future<FindShaderIdsResponse> findAllShaderIds();

  /// Returns a filtered [FindShaderIdsResponse] with a list of shader ids.
  ///
  /// * [term]: Shaders that have [term] in the name or in description
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of shader ids is provided as well as the overall
  /// number of records in total (not the number of shader ids in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is
  /// provided
  Future<FindShaderIdsResponse> findShaderIds(
      {String term, Set<String> filters, Sort sort, int from, int num});
}

/// Extended shadertoy client API
///
/// Extended set of operations not currently supported by the
/// Shadertoy REST API
abstract class ShadertoyExtendedClient extends ShadertoyClient {
  /// Returns a [FindUserResponse] for user with [userId]
  ///
  /// Upon success a [User] object is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [User] is provided
  Future<FindUserResponse> findUserById(String userId);

  /// Returns a filtered [FindShadersResponse] for user [userId]
  ///
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of [Shader] objects is provided as well as the overall
  /// number of records in total (not the number of shaders in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Shader] list is provided
  Future<FindShadersResponse> findShadersByUserId(String userId,
      {Set<String> filters, Sort sort, int from, int num});

  /// Returns a filtered [FindShaderIdsResponse] with a list of shader ids.
  /// for the user [userId]
  ///
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of shader ids is provided as well as the overall
  /// number of records in total (not the number of shader ids in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is
  /// provided
  Future<FindShaderIdsResponse> findShaderIdsByUserId(String userId,
      {Set<String> filters, Sort sort, int from, int num});

  /// Returns a [FindShaderIdsResponse] with all the shader id's
  /// for the user [userId]
  ///
  /// Upon success a list of shader ids is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is provided
  Future<FindShaderIdsResponse> findAllShaderIdsByUserId(String userId);

  /// Returns a [FindCommentsResponse] for a shader with id [shaderId]
  ///
  /// On success comments has the corresponding
  /// list of [Comment] and error set to null
  ///
  /// In case of error a [ResponseError] is set and no [Comment] list is provided
  Future<FindCommentsResponse> findCommentsByShaderId(String shaderId);

  /// Returns a [FindPlaylistResponse] for a playlist with [playlistId]
  ///
  /// Upon success a [Playlist] object is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Playlist] is provided
  Future<FindPlaylistResponse> findPlaylistById(String playlistId);

  /// Returns a [FindShadersResponse] with a list of shaders.
  /// for the playlist [playlistId]
  ///
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of [Shader] objects is provided as well as the overall
  /// number of records in total (not the number of shaders in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no [Shader] list is provided
  Future<FindShadersResponse> findShadersByPlaylistId(String playlistId,
      {int from, int num});

  /// Returns a [FindShaderIdsResponse] with a list of shader ids.
  ///
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success a list of shader ids is provided as well as the overall
  /// number of records in total (not the number of shader ids in the list, the
  /// number of total results). The error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is
  /// provided
  Future<FindShaderIdsResponse> findShaderIdsByPlaylistId(String playlistId,
      {int from, int num});

  /// Returns a [FindShaderIdsResponse] with all the shader id's
  /// for the playlist [playlistId]
  ///
  /// Upon success a list of shader ids is provided and error is set to null
  ///
  /// In case of error a [ResponseError] is set and no shader id list is provided
  Future<FindShaderIdsResponse> findAllShaderIdsByPlaylistId(String playlistId);
}

/// A base implementation class for Shadertoy clients
///
/// It assumes a basic implementation of the client with only the
/// REST base API operations. It provides a contextual object to get
/// Shadertoy website information
abstract class ShadertoyBaseClient implements ShadertoyClient {
  /// The [ShadertoyContext] object stores Shadertoy website contextual
  /// information
  final ShadertoyContext context;

  /// Builds a [ShadertoyBaseClient] object
  ///
  /// The [baseUrl] parameter defines the base url of the Shadertoy website
  ShadertoyBaseClient(String baseUrl) : context = ShadertoyContext(baseUrl);
}

/// A definition of a shadertoy store
///
/// It supports the same operations as [ShadertoyExtendedClient] plus
/// persistence specific operations.
abstract class ShadertoyStore extends ShadertoyExtendedClient {
  /// Saves a [User]
  ///
  /// On success [SaveUserResponse.error] is null
  ///
  /// In case of error [SaveUserResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveUserResponse> saveUser(User user);

  /// Saves a list of [User]'s
  ///
  /// On success [SaveUsersResponse.error] is null
  ///
  /// In case of error [SaveUsersResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveUsersResponse> saveUsers(List<User> users);

  /// Saves a [Shader]
  ///
  /// On success [SaveShaderResponse.error] is null
  ///
  /// In case of error [SaveShaderResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveShaderResponse> saveShader(Shader shader);

  /// Saves a list of [Shader]'s
  ///
  /// On success [SaveShadersResponse.error] is null
  ///
  /// In case of error [SaveShadersResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveShadersResponse> saveShaders(List<Shader> shaders);

  /// Saves a list of [Comment]
  ///
  /// On success [SaveShaderCommentsResponse.error] is null
  ///
  /// In case of error [SaveShaderCommentsResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveShaderCommentsResponse> saveShaderComments(
      String shaderId, List<Comment> comments);

  /// Saves a [Playlist]
  ///
  /// On success [SavePlaylistResponse.error] is null
  ///
  /// In case of error [SavePlaylistResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SavePlaylistResponse> savePlaylist(Playlist playlist);

  /// Associates a list of shader is with a playlist
  ///
  /// On success [SavePlaylistShadersResponse.error] is null
  ///
  /// In case of error [SavePlaylistShadersResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SavePlaylistShadersResponse> savePlaylistShaders(
      String playlistId, List<String> shaderIds);
}

/// A base implementation of Shadertoy stores
abstract class ShadertoyBaseStore implements ShadertoyStore {}
