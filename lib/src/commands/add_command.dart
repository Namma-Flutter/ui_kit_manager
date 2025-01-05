import 'dart:io';

import 'package:nui/global.dart';
import 'package:nui/src/utils/copy_dir.dart';
import 'package:nui/src/utils/is_flutter_project.dart';

Future<void> add(String template) async {
  print("Adding $template to your project");
  // populating path which points to the namma_ui_kit index files.
  String indexUrl = "$contentUrl/.index/lib/$template/index.json";
  if (isFlutterProject(Directory.current.path)) {
    copyGitDirectorySync(
        indexUrl, "${Directory.current.path}/lib/nui_kit");
  } else {
    copyGitDirectorySync(indexUrl, Directory.current.path);
  }
}
