
import 'dart:io';

import 'package:args/args.dart';
import 'package:mason/mason.dart';

import '../utils/directory.dart';
import '../utils/logs.dart';

/// The _generateBLoCItems function generates the folder structure according
/// BLoC imports and usage.
///
/// [dryRun] is a dev-only boolean to generate example folders
Future<void> generateBLoC(
  ArgResults argResults, {
  bool dryRun = false,
}) async {
  final customPath = argResults['path'] != null ? true : false;
  var dir = argResults['path'] ?? 'feature';
  if (dryRun) {
    dir = 'example';
  }
  try {
    final brick = Brick.git(
      GitPath(
        'https://github.com/RyanDsilva/feature_folder_cli',
        path: 'bricks/bloc',
      ),
    );
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(
      Directory(customPath
          ? DirectoryService.replaceAsExpected(path: 'lib/$dir')
          : DirectoryService.paths[dir]!),
    );
    await generator.generate(
      target,
      vars: <String, dynamic>{'name': argResults['name'].toString()},
    );
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
