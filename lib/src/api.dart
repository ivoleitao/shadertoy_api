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

/// Base shadertoy client API
///
/// All the basic operations supported through
/// the Shadertoy REST API.
abstract class ShadertoyClient {
  /// Returns a [FindShaderResponse] for the shader with [shaderId]
  ///
  /// Upon success [FindShaderResponse.shader] has the corresponding
  /// [Shader] object and a null [FindShaderResponse.error]
  ///
  /// In case of error [FindShaderResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShaderResponse.shader]
  Future<FindShaderResponse> findShaderById(String shaderId);

  /// Returns a [FindShadersResponse] for the shader id's in [shaderIds]
  ///
  /// Upon success [FindShadersResponse.shaders] has the corresponding
  /// [Shader] objects and a null [FindShaderResponse.error]
  ///
  /// In case of error [FindShadersResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShadersResponse.shaders]
  Future<FindShadersResponse> findShadersByIdSet(Set<String> shaderIds);

  /// Returns a filtered [FindShadersResponse] with a list of shaders
  ///
  /// * [term]: Shaders that have [term] in the name or in description
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success [FindShadersResponse.shaders] has the corresponding
  /// [Shader] objects, the overal number of records in [FindShadersResponse.total]
  /// (not the number of shaders in [FindShadersResponse.shaders])
  /// and a null [FindShadersResponse.error]
  ///
  /// In case of error [FindShadersResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShadersResponse.shaders]
  Future<FindShadersResponse> findShaders(
      {String term, Set<String> filters, Sort sort, int from, int num});

  /// Returns a [FindShaderIdsResponse] with all the shader id's
  ///
  /// Upon success [FindShaderIdsResponse.ids] has the corresponding
  /// ids and a null [FindShaderIdsResponse.error]
  ///
  /// In case of error [FindShaderIdsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShaderIdsResponse.ids]
  Future<FindShaderIdsResponse> findAllShaderIds();

  /// Returns a filtered [FindShaderIdsResponse] with a list of shader ids.
  ///
  /// * [term]: Shaders that have [term] in the name or in description
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success [FindShaderIdsResponse.ids] has the corresponding
  /// ids, the overal number of records in [FindShaderIdsResponse.total]
  /// (not the number of shaders in [FindShaderIdsResponse.ids])
  /// and a null [FindShaderIdsResponse.error]
  ///
  /// In case of error [FindShaderIdsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShaderIdsResponse.ids]
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
  /// On success [FindUserResponse.user] has the corresponding
  /// [User] and a null [FindUserResponse.error]
  ///
  /// In case of error [FindUserResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindUserResponse.user]
  Future<FindUserResponse> findUserById(String userId);

  /// Returns a filtered [FindShadersResponse] for user [userId]
  ///
  /// * [filters]: A set of tag filters
  /// * [sort]: The sort order of the shaders
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success [FindShadersResponse.shaders] has the corresponding
  /// [Shader] objects, the overal number of records in [FindShadersResponse.total]
  /// (not the number of shaders in [FindShadersResponse.shaders])
  /// and a null [FindShadersResponse.error]
  ///
  /// In case of error [FindShadersResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShadersResponse.shaders]
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
  /// Upon success [FindShaderIdsResponse.ids] has the corresponding
  /// ids, the overal number of records in [FindShaderIdsResponse.total]
  /// (not the number of shaders in [FindShaderIdsResponse.ids])
  /// and a null [FindShaderIdsResponse.error]
  ///
  /// In case of error [FindShaderIdsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShaderIdsResponse.ids]
  Future<FindShaderIdsResponse> findShaderIdsByUserId(String userId,
      {Set<String> filters, Sort sort, int from, int num});

  /// Returns a [FindCommentsResponse] for a shader with id [shaderId]
  ///
  /// On success [FindCommentsResponse.comments] has the corresponding
  /// list of [Comment] and a null [FindCommentsResponse.error]
  ///
  /// In case of error [FindCommentsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindCommentsResponse.comments]
  Future<FindCommentsResponse> findCommentsByShaderId(String shaderId);

  /// Returns a [FindPlaylistResponse] for a playlist with [playlistId]
  ///
  /// On success [FindPlaylistResponse.playlist] has the corresponding
  /// [Playlist] and a null [FindPlaylistResponse.error]
  ///
  /// In case of error [FindPlaylistResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindPlaylistResponse.playlist]
  Future<FindPlaylistResponse> findPlaylistById(String playlistId);

  /// Returns a [FindShadersResponse] with a list of shaders.
  /// for the playlist [playlistId]
  ///
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success [FindShadersResponse.shaders] has the corresponding
  /// shaders, the overal number of records in [FindShadersResponse.total]
  /// (not the number of shaders in [FindShadersResponse.shaders])
  /// and a null [FindShadersResponse.error]
  ///
  /// In case of error [FindShadersResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShadersResponse.shaders]
  Future<FindShadersResponse> findShadersByPlaylistId(String playlistId,
      {int from, int num});

  /// Returns a [FindShaderIdsResponse] with a list of shader ids.
  ///
  /// * [from]: A 0 based index for results returned
  /// * [num]: The total number of results
  ///
  /// Upon success [FindShaderIdsResponse.ids] has the corresponding
  /// ids, the overal number of records in [FindShaderIdsResponse.total]
  /// (not the number of shaders in [FindShaderIdsResponse.ids])
  /// and a null [FindShaderIdsResponse.error]
  ///
  /// In case of error [FindShaderIdsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindShaderIdsResponse.ids]
  Future<FindShaderIdsResponse> findShaderIdsByPlaylistId(String playlistId,
      {int from, int num});
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

  /// Saves a [Shader]
  ///
  /// On success [SaveShaderResponse.error] is null
  ///
  /// In case of error [SaveShaderResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveShaderResponse> saveShader(Shader shader);

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
}

/// A base implementation of Shadertoy stores
///
/// It provides the same contextual information supported by [ShadertoyBaseClient]
/// and additionally persistent contract through [ShadertoyStore] definition.
abstract class ShadertoyBaseStore extends ShadertoyClient
    implements ShadertoyStore {}
