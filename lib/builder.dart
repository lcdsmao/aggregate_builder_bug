import 'dart:async';

import 'package:build/build.dart';

Builder aggBuilder(BuilderOptions options) => AggBuilder();

class AggBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    print('build');
    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, 'lib/foo.gen.dart'),
      'const foo = 0;',
    );
    await buildStep.writeAsString(
      AssetId(buildStep.inputId.package, 'lib/bar.gen.dart'),
      'const bar = 1;',
    );
  }

  @override
  Map<String, List<String>> get buildExtensions => const {
        r'$package$': [
          'lib/foo.gen.dart',
          'lib/bar.gen.dart',
        ],
      };
}
