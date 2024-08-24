import 'dart:io';

import 'package:nuk/global.dart';
import 'package:nuk/src/utils/copy_dir.dart';
import 'package:nuk/src/utils/is_flutter_project.dart';
import 'package:nuk/src/utils/repo_checker.dart';

Future<void> add(String folder) async {
  // check repo exist
  await checkUpdate();
  // check folder exist
  if (Directory("$clonePath/lib/pages/$folder").existsSync()) {
    if (isFlutterProject(Directory.current.path)) {
      copyDirectorySync(
          "$clonePath/lib/pages", "${Directory.current.path}/lib/namma_ui_kit");
    } else {
      copyDirectorySync("$clonePath/lib/pages", Directory.current.path);
    }
    // do clone
  } else {
    print("No UI found please check again");
    // show error msg
  }
}
