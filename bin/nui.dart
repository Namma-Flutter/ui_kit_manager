import 'package:nui/main.dart' as nui;

Future<void> main(List<String> arguments) async {
  switch (arguments[0].toLowerCase()) {
    case "add":
      nui.add(arguments[1]);
      break;
    case "version":
      // todo: check version of repo and pkg
      break;
    default:
      print("No command called ${arguments[0]} found !");
  }
}
