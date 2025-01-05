import 'dart:io';

import 'package:nui/global.dart';
import 'package:nui/src/utils/copy_dir.dart';
import 'package:nui/src/utils/is_flutter_project.dart';

Future<void> add(String folder) async {
  // check repo exist
  // await checkUpdate(); // no longer needed alternatively using git as repo
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
