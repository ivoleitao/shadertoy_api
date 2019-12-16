import 'package:shadertoy_api/src/model/sampler.dart';
import 'package:test/test.dart';

void main() {
  test('Create a sampler', () {
    var sampler = Sampler(
        filter: FilterType.linear,
        wrap: WrapType.clamp,
        vflip: true,
        srgb: true,
        internal: 'internal1');
    expect(sampler.filter, FilterType.linear);
    expect(sampler.wrap, WrapType.clamp);
    expect(sampler.vflip, true);
    expect(sampler.srgb, true);
    expect(sampler.internal, 'internal1');
  });

  test('Convert a sampler to a JSON serializable map and back', () {
    var sampler1 = Sampler(
        filter: FilterType.linear,
        wrap: WrapType.clamp,
        vflip: true,
        srgb: true,
        internal: 'internal1');

    var json = sampler1.toJson();
    var sampler2 = Sampler.fromJson(json);
    expect(sampler1, equals(sampler2));
  });
}
