import 'dart:convert';

import 'package:shadertoy_api/shadertoy_api.dart';
import 'package:shadertoy_api/src/response.dart';
import 'package:test/test.dart';

void main() {
  var genericResponseError1 = ResponseError(
      code: ErrorCode.UNKNOWN,
      message: 'Unknown error',
      context: CONTEXT_SHADER,
      target: 'wtd3zs');

  test('Convert a response error to a JSON serializable map and back', () {
    var json = genericResponseError1.toJson();
    var genericResponseError2 = ResponseError.fromJson(json);
    expect(genericResponseError1, equals(genericResponseError2));
  });

  test('Test a generic response error', () {
    expect(genericResponseError1.code, ErrorCode.UNKNOWN);
    expect(genericResponseError1.message, 'Unknown error');
    expect(genericResponseError1.context, CONTEXT_SHADER);
    expect(genericResponseError1.target, 'wtd3zs');
  });

  test('Create a authentication response error', () {
    var responseError = ResponseError.authentication(
        message: 'Authentication error',
        context: CONTEXT_USER,
        target: 'email@email.com');
    expect(responseError.code, ErrorCode.AUTHENTICATION);
    expect(responseError.message, 'Authentication error');
    expect(responseError.context, CONTEXT_USER);
    expect(responseError.target, 'email@email.com');
  });

  test('Create a authorization response error', () {
    var responseError = ResponseError.authorization(
        message: 'Authorization error',
        context: CONTEXT_USER,
        target: 'email@email.com');
    expect(responseError.code, ErrorCode.AUTHORIZATION);
    expect(responseError.message, 'Authorization error');
    expect(responseError.context, CONTEXT_USER);
    expect(responseError.target, 'email@email.com');
  });

  test('Create a backend timeout response error', () {
    var responseError = ResponseError.backendTimeout(
        message: 'Backend timeout error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_TIMEOUT);
    expect(responseError.message, 'Backend timeout error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a backend status response error', () {
    var responseError = ResponseError.backendStatus(
        message: 'Backend status error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_STATUS);
    expect(responseError.message, 'Backend status error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a backend response response error', () {
    var responseError = ResponseError.backendResponse(
        message: 'Backend response error',
        context: CONTEXT_SHADER,
        target: 'wtd3zs');
    expect(responseError.code, ErrorCode.BACKEND_RESPONSE);
    expect(responseError.message, 'Backend response error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a not found response error', () {
    var responseError = ResponseError.notFound(
        message: 'Not found error', context: CONTEXT_SHADER, target: 'wtd3zs');
    expect(responseError.code, ErrorCode.NOT_FOUND);
    expect(responseError.message, 'Not found error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a aborted response error', () {
    var responseError = ResponseError.aborted(
        message: 'Aborted error', context: CONTEXT_SHADER, target: 'wtd3zs');
    expect(responseError.code, ErrorCode.ABORTED);
    expect(responseError.message, 'Aborted error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  test('Create a unknown response error', () {
    var responseError = ResponseError.unknown(
        message: 'Unknown error', context: CONTEXT_SHADER, target: 'wtd3zs');
    expect(responseError.code, ErrorCode.UNKNOWN);
    expect(responseError.message, 'Unknown error');
    expect(responseError.context, CONTEXT_SHADER);
    expect(responseError.target, 'wtd3zs');
  });

  var loginResponse1 = LoginResponse(error: null);

  test('Test a login response', () {
    expect(loginResponse1.error, isNull);
  });

  test('Convert a login response to a JSON serializable map and back', () {
    var json = loginResponse1.toJson();
    var loginResponse2 = LoginResponse.fromJson(json);
    expect(loginResponse1, equals(loginResponse2));
  });

  var logoutResponse1 = LogoutResponse(error: null);

  test('Test a logout response', () {
    expect(logoutResponse1.error, isNull);
  });

  test('Convert a logout response to a JSON serializable map and back', () {
    var json = logoutResponse1.toJson();
    var logoutResponse2 = LogoutResponse.fromJson(json);
    expect(logoutResponse1, equals(logoutResponse2));
  });

  var memberSince = DateTime(2000, 1, 1, 0, 0, 0);
  var user = User(
      id: 'id1',
      picture: 'picture1',
      memberSince: memberSince,
      about: 'about1');
  var findUserResponse1 = FindUserResponse(user: user, error: null);

  test('Test a find user response', () {
    expect(findUserResponse1.user, user);
    expect(findUserResponse1.error, isNull);
  });

  test('Convert a find user response to a JSON serializable map and back', () {
    var json = findUserResponse1.toJson();
    var findUserResponse2 = FindUserResponse.fromJson(json);
    expect(findUserResponse1, equals(findUserResponse2));
  });

  var userIds = ['iq', 'shaderflix'];
  var findUserIdsResponse1 = FindUserIdsResponse(ids: userIds, error: null);

  test('Test a find user ids response', () {
    expect(findUserIdsResponse1.ids, userIds);
    expect(findUserIdsResponse1.error, isNull);
  });

  test('Convert a find user ids response to a JSON serializable map and back',
      () {
    var json = findUserIdsResponse1.toJson();
    var findUserIdsResponse2 = FindUserIdsResponse.fromJson(json);
    expect(findUserIdsResponse1, equals(findUserIdsResponse2));
  });

  var saveUserResponse1 = SaveUserResponse(error: null);

  test('Test save user response', () {
    expect(saveUserResponse1.error, isNull);
  });

  var saveUsersResponse1 = SaveUsersResponse(error: null);

  test('Test save users response', () {
    expect(saveUsersResponse1.error, isNull);
  });

  var deleteUserResponse1 = DeleteUserResponse(error: null);

  test('Test delete user response', () {
    expect(deleteUserResponse1.error, isNull);
  });

  var date = DateTime(2000, 1, 1, 0, 0, 0);
  var info = Info(
      id: 'id1',
      date: date,
      views: 1,
      name: 'name1',
      userId: 'userId1',
      description: 'description1',
      likes: 1,
      privacy: ShaderPrivacy.public_api,
      flags: 1,
      tags: ['test1'],
      hasLiked: true);
  var sampler = Sampler(
      filter: FilterType.linear,
      wrap: WrapType.clamp,
      vflip: true,
      srgb: true,
      internal: 'internal1');
  var input = Input(
      id: 'id1',
      src: 'src1',
      type: InputType.buffer,
      channel: 1,
      sampler: sampler,
      published: 1);
  var output = Output(id: 'id1', channel: 1);
  var renderPass = RenderPass(
      name: 'name1',
      type: RenderPassType.buffer,
      description: 'description1',
      code: 'code1',
      inputs: [input],
      outputs: [output]);
  var shader = Shader(version: '1', info: info, renderPasses: [renderPass]);
  var findShaderResponse1 = FindShaderResponse(shader: shader, error: null);

  test('Test a find shader response', () {
    expect(findShaderResponse1.shader, shader);
    expect(findShaderResponse1.error, isNull);
  });

  test('Convert a find shader response to a JSON serializable map and back',
      () {
    var json = findShaderResponse1.toJson();
    var findShaderResponse2 = FindShaderResponse.fromJson(json);
    expect(findShaderResponse1, equals(findShaderResponse2));
  });

  var shaderIds = ['wtd3zs', 'XlcBRX'];
  var findShaderIdsResponse1 =
      FindShaderIdsResponse(ids: shaderIds, error: null);

  test('Test a find shader ids response', () {
    expect(findShaderIdsResponse1.ids, shaderIds);
    expect(findShaderIdsResponse1.error, isNull);
  });

  test('Convert a find shader ids response to a JSON serializable map and back',
      () {
    var json = findShaderIdsResponse1.toJson();
    var findShaderIdsResponse2 = FindShaderIdsResponse.fromJson(json);
    expect(findShaderIdsResponse1, equals(findShaderIdsResponse2));
  });

  var shaders = [findShaderResponse1];
  var findShadersResponse1 =
      FindShadersResponse(total: 1, shaders: shaders, error: null);

  test('Test find shaders response', () {
    expect(findShadersResponse1.total, 1);
    expect(findShadersResponse1.shaders, shaders);
    expect(findShadersResponse1.error, isNull);
  });

  test('Convert find shaders response to a JSON serializable map and back', () {
    var json = findShadersResponse1.toJson();
    var findShadersResponse2 = FindShadersResponse.fromJson(json);
    expect(findShadersResponse1, equals(findShadersResponse2));
  });

  var saveShaderResponse1 = SaveShaderResponse(error: null);

  test('Test save shader response', () {
    expect(saveShaderResponse1.error, isNull);
  });

  var saveShadersResponse1 = SaveShadersResponse(error: null);

  test('Test save shaders response', () {
    expect(saveShadersResponse1.error, isNull);
  });

  var deleteShaderResponse1 = DeleteShaderResponse(error: null);

  test('Test delete shader response', () {
    expect(deleteShaderResponse1.error, isNull);
  });

  var texts = ['comment1', 'comment2'];
  var dates = ['1548620329', '1551293191'];
  var userPictures = [
    '/img/profile.jpg',
    '/media/users/scratch13764/profile.png'
  ];
  var commentsResponse1 = CommentsResponse(
      texts: texts,
      dates: dates,
      userIds: userIds,
      userPictures: userPictures,
      error: null);

  test('Test a comments response', () {
    expect(commentsResponse1.texts, texts);
    expect(commentsResponse1.dates, dates);
    expect(commentsResponse1.userIds, userIds);
    expect(commentsResponse1.userPictures, userPictures);
    expect(commentsResponse1.error, isNull);
  });

  test('Convert a comments response to a JSON serializable map and back', () {
    var json = commentsResponse1.toJson();
    var commentsResponse2 = CommentsResponse.fromMap(json);
    expect(commentsResponse1, equals(commentsResponse2));
  });

  var now = DateTime.now();
  var comment1 = Comment(
      id: 'comentId1',
      shaderId: 'shaderId1',
      userId: 'userId1',
      picture: '/img/profile.jpg',
      date: now,
      text: 'text1');

  var findCommentResponse1 =
      FindCommentResponse(comment: comment1, error: null);

  test('Test find commment response', () {
    expect(findCommentResponse1.comment, comment1);
    expect(findCommentResponse1.error, isNull);
  });

  test('Convert a find comment response to a JSON serializable map and back',
      () {
    var json = findCommentResponse1.toJson();
    var findCommentResponse2 = FindCommentResponse.fromJson(json);
    expect(findCommentResponse1, equals(findCommentResponse2));
  });

  var commentIds = ['week', 'featured'];
  var findCommentIdsResponse1 =
      FindCommentIdsResponse(ids: commentIds, error: null);

  test('Test a find comment ids response', () {
    expect(findCommentIdsResponse1.ids, commentIds);
    expect(findCommentIdsResponse1.error, isNull);
  });

  test(
      'Convert a find comment ids response to a JSON serializable map and back',
      () {
    var json = findCommentIdsResponse1.toJson();
    var findCommentIdsResponse2 = FindCommentIdsResponse.fromJson(json);
    expect(findCommentIdsResponse1, equals(findCommentIdsResponse2));
  });

  var comment2 = Comment(
      id: 'commentId2',
      shaderId: 'shaderId2',
      userId: 'userId2',
      picture: '/img/profile.jpg',
      date: now,
      text: 'text2',
      hidden: true);
  var comments = [comment1, comment2];
  var findCommentsResponse1 =
      FindCommentsResponse(total: 2, comments: comments, error: null);

  test('Test a find comments response', () {
    expect(findCommentsResponse1.total, 2);
    expect(findCommentsResponse1.comments, comments);
    expect(findCommentsResponse1.error, isNull);
  });

  test('Convert a find comments response to a JSON serializable map and back',
      () {
    var json = findCommentsResponse1.toJson();
    var findCommentsResponse2 = FindCommentsResponse.fromJson(json);
    expect(findCommentsResponse1, equals(findCommentsResponse2));
  });

  var saveShaderCommentsResponse1 = SaveShaderCommentsResponse(error: null);

  test('Test save shader comments response', () {
    expect(saveShaderCommentsResponse1.error, isNull);
  });

  var deleteCommentResponse1 = DeleteCommentResponse(error: null);

  test('Test delete comment response', () {
    expect(deleteCommentResponse1.error, isNull);
  });

  var playlist1 = Playlist(
      id: 'week',
      userId: 'shadertoy',
      name: 'Shaders of the Week',
      description: 'Playlist with every single shader of the week ever.',
      privacy: PlaylistPrivacy.public);
  var findPlaylistResponse1 =
      FindPlaylistResponse(playlist: playlist1, error: null);

  test('Test a find playlist response', () {
    expect(findPlaylistResponse1.playlist, playlist1);
    expect(findPlaylistResponse1.error, isNull);
  });

  test('Convert a find playlist response to a JSON serializable map and back',
      () {
    var json = findPlaylistResponse1.toJson();
    var findPlaylistResponse2 = FindPlaylistResponse.fromJson(json);
    expect(findPlaylistResponse1, equals(findPlaylistResponse2));
  });

  var playlistIds = ['week', 'featured'];
  var findPlaylistIdsResponse1 =
      FindPlaylistIdsResponse(ids: playlistIds, error: null);

  test('Test a find playlist ids response', () {
    expect(findPlaylistIdsResponse1.ids, playlistIds);
    expect(findPlaylistIdsResponse1.error, isNull);
  });

  test(
      'Convert a find playlist ids response to a JSON serializable map and back',
      () {
    var json = findPlaylistIdsResponse1.toJson();
    var findPlaylistIdsResponse2 = FindPlaylistIdsResponse.fromJson(json);
    expect(findPlaylistIdsResponse1, equals(findPlaylistIdsResponse2));
  });

  var playlist2 = Playlist(
      id: 'featured',
      userId: 'shadertoy',
      name: 'Featured Shaders',
      description: 'Playlist with every single featured shader ever.',
      privacy: PlaylistPrivacy.public);
  var findPlaylistsResponse1 =
      FindPlaylistsResponse(playlists: [playlist1, playlist2], error: null);

  test('Test a find playlists response', () {
    expect(findPlaylistsResponse1.playlists, [playlist1, playlist2]);
    expect(findPlaylistsResponse1.error, isNull);
  });

  test('Convert a find playlists response to a JSON serializable map and back',
      () {
    var json = findPlaylistsResponse1.toJson();
    var findPlaylistsResponse2 = FindPlaylistsResponse.fromJson(json);
    expect(findPlaylistsResponse1, equals(findPlaylistsResponse2));
  });

  var savePlaylistResponse1 = SavePlaylistResponse(error: null);

  test('Test save playlist response', () {
    expect(savePlaylistResponse1.error, isNull);
  });

  var savePlaylistShadersResponse1 = SavePlaylistShadersResponse(error: null);

  test('Test save playlist shaders response', () {
    expect(savePlaylistShadersResponse1.error, isNull);
  });

  var deletePlaylistResponse1 = DeletePlaylistResponse(error: null);

  test('Test delete playlist response', () {
    expect(deletePlaylistResponse1.error, isNull);
  });

  var bytes = utf8.encode('bytes');
  var donwloadFileResponse1 = DownloadFileResponse(bytes: bytes, error: null);

  test('Test download file response', () {
    expect(donwloadFileResponse1.bytes, bytes);
    expect(donwloadFileResponse1.error, isNull);
  });
}
