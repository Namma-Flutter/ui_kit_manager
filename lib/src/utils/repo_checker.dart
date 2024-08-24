import 'package:process_run/cmd_run.dart';
import 'dart:io';
import 'package:nuk/global.dart';
// import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkUpdate() async {
  // final prefs = await SharedPreferences.getInstance();
  if (Directory(clonePath).existsSync()) {
    // final lastUpdate =
        // prefs.getInt('lastUpdate') ?? DateTime.now().millisecondsSinceEpoch;
    // If the repo already exists, pull the latest changes

    // if (DateTime.now()
    //     .isBefore(DateTime.fromMillisecondsSinceEpoch(lastUpdate))) {
      await pullRepo(clonePath);
      // prefs.setInt('lastUpdate', DateTime.now().millisecondsSinceEpoch);
    // }
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
  print(result.stdout);
  if (result.exitCode == 0) {
    // print('Repository updated successfully.');
  } else {
    print('Failed to pull latest changes.');
  }
}
