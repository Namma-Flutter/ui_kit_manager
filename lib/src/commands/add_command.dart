import 'dart:io';

import 'package:nuk/global.dart';
import 'package:nuk/src/utils/copy_dir.dart';
import 'package:nuk/src/utils/repo_checker.dart';

Future<void> add(String folder) async {
  // check repo exist
  await checkUpdate();
  // check folder exist
  if (Directory("$clonePath/lib/pages/$folder").existsSync()) {

    copyDirectorySync("$clonePath/lib/pages","${Directory.current.path}");
    // do clone
  } else {
    print("No UI found please check again");
    // show error msg
  }
}
