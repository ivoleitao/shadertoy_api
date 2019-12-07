import 'dart:convert';

import 'package:shadertoy_api/shadertoy_api.dart';

main() {
  JsonEncoder encoder = JsonEncoder.withIndent('  ');

  // Create a user
  User user = User(
      id: 'userid',
      about: 'About this user',
      memberSince: DateTime.now(),
      shaders: 1,
      comments: 1);
  print(encoder.convert(user));

  // Creates a anonymous site account
  Account anonymousSiteAccount =
      Account.anonymous(displayName: 'Anonymous site user');
  print(encoder.convert(anonymousSiteAccount));

  // Creates a registered site account
  Account registeredSiteAccount = Account.registered(
      name: 'userId',
      displayName: 'Registered site account',
      password: 'password');
  print(encoder.convert(registeredSiteAccount));

  // Creates a api account
  Account apiAccount =
      Account.api(displayName: 'API account', apiKey: 'apikey');
  print(encoder.convert(apiAccount));

  // Creates a Shader with two render passes
  Shader shader = Shader(
      version: '0.1',
      info: Info(
          id: 'ZzZ0Zz',
          date: DateTime.fromMillisecondsSinceEpoch(1360495251),
          views: 131083,
          name: 'Example',
          userId: 'example',
          description: 'A shader example',
          likes: 570,
          publishStatus: PublishStatus.public_api,
          flags: 32,
          tags: [
            'procedural',
            '3d',
            'raymarching',
            'distancefield',
            'terrain',
            'motionblur',
            'vr'
          ],
          hasLiked: false),
      renderPasses: [
        RenderPass(
            name: 'Image',
            type: RenderPassType.image,
            description: '',
            code: 'code 0',
            inputs: [
              Input(
                  id: '257',
                  src: '/media/previz/buffer00.png',
                  type: InputType.texture,
                  channel: 0,
                  sampler: Sampler(
                      filter: FilterType.linear,
                      wrap: WrapType.clamp,
                      vflip: true,
                      srgb: true,
                      internal: 'byte'),
                  published: 1)
            ],
            outputs: [
              Output(id: '37', channel: 0)
            ]),
        RenderPass(
            name: 'Buffer A',
            type: RenderPassType.buffer,
            description: '',
            code: 'code 1',
            inputs: [
              Input(
                  id: '17',
                  src: '/media/a/zs098rere0323u85534ukj4.png',
                  type: InputType.texture,
                  channel: 0,
                  sampler: Sampler(
                      filter: FilterType.mipmap,
                      wrap: WrapType.repeat,
                      vflip: false,
                      srgb: false,
                      internal: 'byte'),
                  published: 1)
            ],
            outputs: [
              Output(id: '257', channel: 0)
            ])
      ]);
  print(encoder.convert(shader));

  // Creates a shader comment
  Comment comment = Comment(
      shaderId: 'AaA0Aa',
      userId: 'userId',
      date: DateTime.now(),
      text: 'Great shader!');
  print(encoder.convert(comment));

  // Creates a playlist
  Playlist playlist =
      Playlist(id: 'ZzZ0Zz', name: 'Playlist', count: 1, shaders: ['ZzZ0Zz']);
  print(encoder.convert(playlist));
}
