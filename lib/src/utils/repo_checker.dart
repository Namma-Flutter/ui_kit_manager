import 'package:process_run/cmd_run.dart';
import 'dart:io';
import 'package:nuk/global.dart';

Future<void> checkUpdate() async {
  if (Directory(clonePath).existsSync()) {
    // If the repo already exists, pull the latest changes
    print('Repository exists. Pulling latest changes...');
    await pullRepo(clonePath);
  } else {
    // If the repo doesn't exist, clone it
    print('Repository does not exist. Cloning...');
    await cloneRepo(repoUrl, clonePath);
  }
}

Future<void> cloneRepo(String repoUrl, String clonePath) async {
  final result =
      await runExecutableArguments('git', ['clone', repoUrl, clonePath]);
  print(result.stdout);
  if (result.exitCode == 0) {
    print('Repository cloned successfully.');
  } else {
    print('Failed to clone repository.');
  }
}

Future<void> pullRepo(String repoPath) async {
  final result = await runExecutableArguments('git', ['-C', repoPath, 'pull']);
  print(result.stdout);
  if (result.exitCode == 0) {
    print('Repository updated successfully.');
  } else {
    print('Failed to pull latest changes.');
  }
}
