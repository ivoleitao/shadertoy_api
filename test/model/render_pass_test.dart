import 'package:shadertoy_api/src/model/input.dart';
import 'package:shadertoy_api/src/model/output.dart';
import 'package:shadertoy_api/src/model/render_pass.dart';
import 'package:shadertoy_api/src/model/sampler.dart';
import 'package:test/test.dart';

void main() {
  test('Create a render pass', () {
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
    expect(renderPass.name, 'name1');
    expect(renderPass.type, RenderPassType.buffer);
    expect(renderPass.description, 'description1');
    expect(renderPass.code, 'code1');
    expect(renderPass.inputs, [input]);
    expect(renderPass.outputs, [output]);
  });

  test('Convert a render pass to a JSON serializable map and back', () {
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
    var renderPass1 = RenderPass(
        name: 'name1',
        type: RenderPassType.buffer,
        description: 'description1',
        code: 'code1',
        inputs: [input],
        outputs: [output]);

    var json = renderPass1.toJson();
    var renderPass2 = RenderPass.fromJson(json);
    expect(renderPass1, equals(renderPass2));
  });
}
