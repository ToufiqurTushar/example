import 'package:flutter_rapid/flutter_rapid.dart';
import '../../layouts/header_widget.dart';
import '../../layouts/sizebox_widgets.dart';
import '../../layouts/text_widgets.dart';
import '../settings/setting_i18n.dart';
import '../settings/setting_logic.dart';


class SettingView extends RapidView<SettingLogic> {
  static String routeName = "/setting";

  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Scaffold(
        appBar: AppBar(title: Text('Setting'), actions: [
          IconButton(onPressed:()=>Get.toNamed(SettingView.routeName), icon: Icon(Icons.settings))
        ],),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MediumSpacer(),
                HeaderWidget(
                  backgroundColor: Color(0xfff7faeb),
                  headerMargin: EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment .start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.1), child: Icon(Icons.dark_mode, color: Colors.grey),),
                        title: NormalText("Dark Theme"),
                        dense: true,
                        trailing: Switch(
                          value: controller.isDarkTeheme.value,
                          onChanged: (val) {
                            controller.globalState.toggleThemeMode();
                            controller.isDarkTeheme.value = !controller.isDarkTeheme.value;
                          },
                        ),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.1), child: Icon(Icons.language, color: Colors.grey),),
                        title: NormalText("Language"),
                        dense: true,
                        trailing: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Theme.of(context).focusColor,
                          ),
                          onSelected: (value) {
                            if (value == 'English') {
                              controller.globalState.changeLocale("en_US");
                            } else if (value == 'Bangla') {
                              controller.globalState.changeLocale("bn_BD");
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'English',
                              child: Row(
                                children: [
                                  Icon(Icons.language,
                                      color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text('English'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // trailing: Wrap(
                        //   children: [
                        //     TextButton(child: NormalText("English"), onPressed: ()=>controller.globalState.changeLocale("en_US")),
                        //     TextButton(child: NormalText("Bangla"), onPressed: ()=>controller.globalState.changeLocale("bn_BD")),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ),
                MediumSpacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<SettingLogic>(() => SettingLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return SettingI18N.getTranslations();
  }
}
