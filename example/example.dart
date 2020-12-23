import 'dart:convert';

import 'package:shadertoy_api/shadertoy_api.dart';

void main() {
  var encoder = JsonEncoder.withIndent('  ');

  // Create a user
  var user = User(
      id: 'userid',
      about: 'About this user',
      memberSince: DateTime.now(),
      shaders: 1,
      comments: 1);
  print(encoder.convert(user));

  // Creates a Shader with two render passes
  var shader = Shader(
      version: '0.1',
      info: Info(
          id: 'ZzZ0Zz',
          date: DateTime.fromMillisecondsSinceEpoch(1360495251),
          views: 131083,
          name: 'Example',
          userId: 'example',
          description: 'A shader example',
          likes: 570,
          privacy: ShaderPrivacy.public_api,
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
  var comment = Comment(
      id: 'AaA0Aa',
      userId: 'userId',
      userPicture: '/img/profile.jpg',
      date: DateTime.now(),
      text: 'Great shader!');
  print(encoder.convert(comment));

  // Creates a playlist
  var playlist = Playlist(
      id: 'week',
      userId: 'shadertoy',
      name: 'Shaders of the Week',
      description: 'Playlist with every single shader of the week ever.',
      privacy: PlaylistPrivacy.public,
      shaders: 391);
  print(encoder.convert(playlist));
}
