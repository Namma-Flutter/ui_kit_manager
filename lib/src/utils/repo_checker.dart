import 'package:process_run/cmd_run.dart';
import 'dart:io';
import 'package:nui/global.dart';

Future<void> checkUpdate({bool force = false}) async {
  if (Directory(clonePath).existsSync()) {
    int lastUpdate = DateTime.now().millisecondsSinceEpoch;
    try {
      lastUpdate = int.parse(await File('$clonePath/.lastSync').readAsString());
    } catch (e) {
      print(e);
    }
    lastUpdate+=86400000 ;  // plus one day

    // If the repo already exists, pull the latest changes

    if (DateTime.now().millisecondsSinceEpoch>lastUpdate) {
             print("here");
      await pullRepo(clonePath);
      (await File('$clonePath/.lastSync').create())
          .writeAsString(DateTime.now().millisecondsSinceEpoch.toString());
    }
 
  } else {
    // If the repo doesn't exist, clone it

    await cloneRepo(repoUrl, clonePath);
  }
}

Future<void> cloneRepo(String repoUrl, String clonePath) async {
  final result =
      await runExecutableArguments('git', ['clone', repoUrl, clonePath]);
  print(result.stdout);
  if (result.exitCode == 0) {
    // print('Repository cloned successfully.');
  } else {
    print('Failed to clone repository.');
  }
}

Future<void> pullRepo(String repoPath) async {
  final result = await runExecutableArguments('git', ['-C', repoPath, 'pull']);
  if (result.exitCode == 0) {
    // print('Repository updated successfully.');
  } else {
    print('Failed to pull latest changes.');
  }
}
