import 'package:nuk/nuk.dart' as nuk;

Future<void> main(List<String> arguments) async {
  switch (arguments[0].toLowerCase()) {
    case "add":
      nuk.add(arguments[1]);
      break;
    case "version":
      // todo: check version of repo and pkg
      break;
    default:
      print("No command called ${arguments[0]} found !");
  }
}
