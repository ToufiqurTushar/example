import 'package:cowmaster/page/bottom_nav/bottom_nav_view.dart';
import 'package:cowmaster/page/profile/profile_view.dart';
import 'package:cowmaster/page/login/login_view.dart';
import 'package:cowmaster/page/registration/registration_view.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../page/add_cattle/add_cattle_view.dart';
import '../registry.dart';
import 'app_config.dart';
import 'app_theme.dart';

@pragma('vm:entry-point')
Future<void> _backgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp();
  RapidRemoteMessage rapidMessage = RapidRemoteMessage().initFromFirebaseMessage(message);
}

class AppSystemConfig extends RapidSystemConfig {
  String appTitle = "GoruGo";
  ThemeData theme = customLightTheme;
  ThemeData darkTheme = customDarkTheme;
  Map<String, Locale> availableLocal = {
    "bn_BD": const Locale('bn', 'BD'),
    "en_US": const Locale('en', 'US'),
    "ur_PK": const Locale('ur', 'PK')
  };
  String? initialRoute = BottomNavView.routeName;

  List<RapidModuleRegistry> modules = [
    Registry(),
  ];

  RapidSplashScreenData splashScreenData = RapidSplashScreenData().setAppName("GoruGo").setLogo('assets/ic_launcher.png').disable();

  String currentEnv = "dev";
  Map<String, RapidEnvConfig> availableEnvironment = {
    "dev": DevConfig(),
    "stage": StageConfig(),
    "prod": ProdConfig(),
  };

  initConfig(var env) {
    return Get.put<AppBaseConfig>(env);
  }

  Future<void> onAppStartup() async {
    // await RapidPushNotifyManager.inst.init(
    //   androidIcon: "ic_launcher",
    //   pushNotifyCallback: AppPushNotifyCallback(),
    // );
    // await RapidFirebaseNotification.inst.init(
    //   notifyCallback: AppFirebaseNotifyCallback()
    // );
    //RapidFirebaseNotification.onBackgroundMessageHandler(_backgroundMessage);
  }
}
