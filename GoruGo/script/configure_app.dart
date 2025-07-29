import 'dart:io';

Future<void> main(List<String> args) async {
  if (args.length <= 4) {
    print('Usage: Activate Rename');
    print('Usage: dart run script/configure_app.dart <APP_NAME> <BUNDLE_ID> <ICON_PATH> <VERSION> <FLAVOR>');
    print('Usage example: dart run script/configure_app.dart "SuSastho" com.cmedhealth.android assets/images/logo.png 44.0.0.0+44000 dev');
    print('Usage example: dart run script/configure_app.dart "i4we app" com.example.app assets/swasti/app_logo.png 1.0.0+1 swasti_prod run'); //run or apk
    exit(1);
  }

  final appName = args[0]; //i4we app
  final bundleId = args[1]; //com.example.app
  final iconPath = args[2]; // assets/swasti/app_logo.png
  final version = args[3]; // e.g., 1.0.0+1
  final flavor = args[4];  // e.g., DEV or STAGE or PROD or SWASTI or SWASTI_PROD
  final runOrApk = args.length == 6 ?args[5]:"";  // e.g., run or apk

  await _changeAppName(appName);
  await _changeBundleId(bundleId);
  await _changeAppIcon(iconPath);
  await _changeAppSplashIcon(iconPath, "#008000");
  await _changeAppVersion(version);
  //await _generateFlavorMain(flavor);
  //await _generateFirebaseConfig(flavor);

  if(runOrApk == "run") {
    await _runReleaseApp();
  } else if(runOrApk == "apk") {
    await _generateApk();
  }
  print('✅ All updates complete.');
}

Future<void> _changeAppName(String newName) async {
  final result = await Process.run(
    'dart',
    ['run', 'rename_app:main', 'all=$newName'],
    runInShell: true,
  );

  if (result.exitCode != 0) {
    print('❌ Rename failed: ${result.stderr}');
    exit(1);
  }
  // // Android
  // final androidManifest = File('android/app/src/main/AndroidManifest.xml');
  // final androidContent = await androidManifest.readAsString();
  // final updatedAndroid = androidContent.replaceAll(RegExp(r'android:label="[^"]*"'), 'android:label="$newName"');
  // await androidManifest.writeAsString(updatedAndroid);
  //
  // // iOS
  // final iosPlist = File('ios/Runner/Info.plist');
  // final iosContent = await iosPlist.readAsString();
  // final updatedIOS = iosContent.replaceAll(RegExp(r'<key>CFBundleDisplayName</key>\s*<string>[^<]*</string>'),
  //     '<key>CFBundleDisplayName</key>\n\t<string>$newName</string>');
  // await iosPlist.writeAsString(updatedIOS);
  print('✅ App name changed to "$newName"');
}

Future<void> _changeBundleId(String bundleId) async {
  final result = await Process.run(
    'dart',
    ['run', 'change_app_package_name:main', '$bundleId'],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('❌ Rename failed: ${result.stderr}');
    exit(1);
  }
  print('✅ Bundle ID changed to $bundleId');
}

Future<void> _changeAppIcon(String iconPath) async {
  final config = '''
flutter_launcher_icons:
  image_path: "$iconPath"

  android: "ic_launcher"
  min_sdk_android: 21
  ios: true
  remove_alpha_ios: true
''';

  await File('flutter_launcher_icons.yaml').writeAsString(config);
  final result = await Process.run(
    'dart',
    ['run', 'flutter_launcher_icons'],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('❌ Icon generation failed: ${result.stderr}');
    exit(1);
  }
  print('✅ App icon updated');
}

Future<void> _changeAppSplashIcon(String iconPath, String color) async {
  final config = '''
flutter_native_splash:
  color: "$color"
  image: "$iconPath"
  
  android_12:
    image: "$iconPath"
    color: "$color"
''';

  await File('flutter_native_splash.yaml').writeAsString(config);
  final result = await Process.run(
    'dart',
    ['run', 'flutter_native_splash:create', '--path=flutter_native_splash.yaml'],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('❌ Icon generation failed: ${result.stderr}');
    exit(1);
  }
  print('✅ App icon updated');
}

Future<void> _changeAppVersion(String version) async {
  final pubspec = File('pubspec.yaml');
  final lines = await pubspec.readAsLines();

  final updated = lines.map((line) {
    if (line.trim().startsWith('version:')) return 'version: $version';
    return line;
  }).toList();

  String buildNumber = version.split("+")[1];
  version = version.split("+")[0];

  await pubspec.writeAsString(updated.join('\n'));
  // Android build.gradle
  final buildGradle = File('android/app/build.gradle.kts');
  final gradleContent = await buildGradle.readAsString();
  final newAndroid = gradleContent
      .replaceAllMapped(RegExp(r'versionCode\s*=\s*\d+'), (m) => 'versionCode = $buildNumber')
      .replaceAllMapped(RegExp(r'versionName\s*=\s*"[^"]*"'), (m) => 'versionName = "$version"');
  await buildGradle.writeAsString(newAndroid);
  print('✅ Android versionCode = $buildNumber, versionName = $version');

  // iOS Info.plist
  final plist = File('ios/Runner/Info.plist');
  final iosContent = await plist.readAsString();
  final newPlist = iosContent
      .replaceAllMapped(RegExp(r'<key>CFBundleShortVersionString</key>\s*<string>[^<]+</string>'), (m) => '<key>CFBundleShortVersionString</key>\n\t<string>$version</string>')
      .replaceAllMapped(RegExp(r'<key>CFBundleVersion</key>\s*<string>[^<]+</string>'), (m) => '<key>CFBundleVersion</key>\n\t<string>$buildNumber</string>');
  await plist.writeAsString(newPlist);
  print('✅ iOS version = $version, build = $buildNumber');
  print('✅ Version updated to $version');
}

Future<void> _generateFlavorMain(String flavor) async {
  final template = await File('script/main_template.dart').readAsString();
  final rendered = template.replaceAll('\'{{FLAVOR}}\'', "EnvTypeEnum.${flavor.toUpperCase()}\.name");
  final outputFile = File('lib/main.dart');
  await outputFile.writeAsString(rendered);
  print('✅ main.dart generated');
}

Future<void> _generateFirebaseConfig(String flavor) async {
  var template;
  if(flavor.toLowerCase().contains("swasti")) {
    template = await File('script/firebase/google-services-template-swasti.json').readAsString();
  } else {
    template = await File('script/firebase/google-services-template.json').readAsString();
  }
  final outputFile = File('android/app/google-services.json');
  await outputFile.writeAsString(template);
  print('✅ google-services.json generated');
}

Future<void> _runReleaseApp() async {
  print('✅ flutter run --release');
  final result = await Process.run(
    'flutter',
    ['run', '--release'],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('❌ flutter run Error: ${result.stderr}');
    exit(1);
  }

}
Future<void> _generateApk() async {
  print('✅ flutter build apk --release');
  await Process.run(
    'flutter',
    ['clean'],
    runInShell: true,
  );
  final result = await Process.run(
    'flutter',
    ['build', 'apk', '--release'],
    runInShell: true,
  );
  if (result.exitCode != 0) {
    print('❌ Generate Apk Fail: ${result.stderr}');
    exit(1);
  }
}