import 'package:shadertoy_api/src/context.dart';
import 'package:shadertoy_api/src/model/account.dart';
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
/// the Shadertoy REST API. It should not be used directly
/// prefer an implementation of [ShadertoyWS] and/or [ShadertoySite]
abstract class ShadertoyClient {
  ShadertoyContext get context;

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

/// The base Shadertoy Client API for WS access
///
/// This class is marker interface that should be used for
/// base implementations of Shadertoy REST API clients. It should be preferred
/// to [ShadertoyClient] but exists only as a natural counterpart to
/// [ShadertoySite] class
abstract class ShadertoyWS extends ShadertoyClient {}

/// The base Shadertoy Client API for WS and site access to Shadertoy
///
/// This class is a base interface that should be used for
/// for the implementations of Shadertoy REST API and site clients. It exists
/// as a counterpart to [ShadertoyWS] class but adds a number of site only
/// methods to the contract (which does not make sense from a API) perspective
abstract class ShadertoySite extends ShadertoyExtendedClient {
  /// Performs a login in shadertoy website
  ///
  /// Upon success [LoginResponse.error] is null
  ///
  /// In case of error [LoginResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<LoginResponse> login();

  /// Performs a logiout in shadertoy website
  ///
  /// Upon success [LogoutResponse.error] is null
  ///
  /// In case of error [LogoutResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<LogoutResponse> logout();

  /// Returns a [DownloadFileResponse] for a shader with id [shaderId]
  ///
  /// On success [DownloadFileResponse.bytes] has the corresponding
  /// byte list and a null [DownloadFileResponse.error]
  ///
  /// In case of error [DownloadFileResponse.error] has the corresponding
  /// [ResponseError] structure and a null [DownloadFileResponse.bytes]
  Future<DownloadFileResponse> downloadShaderPicture(String shaderId);

  /// Returns a [DownloadFileResponse] for a path [inputPath]
  ///
  /// On success [DownloadFileResponse.bytes] has the corresponding
  /// byte list and a null [DownloadFileResponse.error]
  ///
  /// In case of error [DownloadFileResponse.error] has the corresponding
  /// [ResponseError] structure and a null [DownloadFileResponse.bytes]
  Future<DownloadFileResponse> downloadMedia(String inputPath);
}

/// A base implementation class for Shadertoy clients
///
/// It assumes a basic implementation of the client with only the
/// REST base API operations. It provides a contextual object to get
/// Shadertoy website information
abstract class ShadertoyBaseClient implements ShadertoyClient {
  /// Default base URL for Shadertoy website
  static const String _DefaultBaseUrl = 'https://www.shadertoy.com';

  /// The [ShadertoyContext] object stores Shadertoy website contextual
  /// information
  final ShadertoyContext context;

  /// Builds a [ShadertoyBaseClient] object
  ///
  /// The [baseUrl] parameter provides a way to change the standard URL
  ShadertoyBaseClient({String baseUrl})
      : context = ShadertoyContext(baseUrl ?? _DefaultBaseUrl);
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

  /// Returns a [FindAccountResponse] for a account with [accountId]
  ///
  /// On success [FindAccountResponse.account] has the corresponding
  /// [Account] and a null [FindAccountResponse.error]
  ///
  /// In case of error [FindAccountResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindAccountResponse.account]
  Future<FindAccountResponse> findAccountById(String accountId);

  /// Returns a filtered [FindAccountsResponse]
  ///
  /// * [name]: The name of the account
  /// * [type]: The type of the account
  /// * [system]: If the user is a system user
  ///
  /// Upon success [FindAccountsResponse.accounts] has the corresponding
  /// [Account] objects, and a null [FindAccountsResponse.error]
  ///
  /// In case of error [FindAccountsResponse.error] has the corresponding
  /// [ResponseError] structure and a null [FindAccountsResponse.accounts]
  Future<FindAccountsResponse> findAccounts(
      {String name, AccountType type, bool system});

  /// Saves a [Account]
  ///
  /// On success [SaveAccountResponse.error] is null
  ///
  /// In case of error [SaveAccountResponse.error] has the corresponding
  /// [ResponseError] structure
  Future<SaveAccountResponse> saveAccount(Account account);

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
abstract class ShadertoyBaseStore extends ShadertoyBaseClient
    implements ShadertoyStore {}
