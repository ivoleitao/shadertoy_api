import 'package:shadertoy_api/src/model/input.dart';
import 'package:shadertoy_api/src/model/sampler.dart';
import 'package:test/test.dart';

void main() {
  var sampler = Sampler(
      filter: FilterType.linear,
      wrap: WrapType.clamp,
      vflip: true,
      srgb: true,
      internal: 'internal1');
  var input1 = Input(
      id: 'id1',
      src: 'src1',
      type: InputType.buffer,
      channel: 1,
      sampler: sampler,
      published: 1);
  test('Create a input', () {
    expect(input1.id, 'id1');
    expect(input1.src, 'src1');
    expect(input1.type, InputType.buffer);
    expect(input1.channel, 1);
    expect(input1.sampler, sampler);
    expect(input1.published, 1);
  });

  test('Convert a input to a JSON serializable map and back', () {
    var json = input1.toJson();
    var input2 = Input.fromJson(json);
    expect(input1, equals(input2));
  });
}
