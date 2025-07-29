import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';
import '../../config/app_theme.dart';
import '../../layouts/text_widgets.dart';
import '../../layouts/sizebox_widgets.dart';
import '../login/login_view.dart';
import 'change_password_i18n.dart';
import 'change_password_logic.dart';


class ChangePasswordView extends RapidView<ChangePasswordLogic> {
  static String routeName = "/change_password";

  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Change Password')),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              reverse: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Form(
                            key: controller.formKey,
                            autovalidateMode: controller.formValidateMode.value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset('assets/ic_launcher.png', height: 100, width: 100,)
                                ),
                                XLargeText("GoruGo", isBold: true,),
                                NormalText("Cattle Hard Management System", color: Colors.grey,),
                                NormalSpacer(),
                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Current Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  controller: controller.formController['currentPassword'],
                                  validator: [
                                    FLValidator.required
                                  ].validate(),
                                ),
                                SmallSpacer(),

                                TextFormField(
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'New Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  controller: controller.formController['newPassword'],
                                  validator: [
                                    FLValidator.required
                                  ].validate(),
                                ),
                                SmallSpacer(),

                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Confirm New Password',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  obscureText: true,
                                  controller: controller.formController['confirmNewPassword'],
                                  validator: [
                                    FLValidator.required,
                                    FLValidator.same(controller.formController['newPassword']!.text)
                                  ].validate(
                                      customMessages: {
                                        'same': "Confirm New Password doesn't match"
                                      }
                                  ),
                                ),
                                SmallSpacer(),

                                SizedBox(
                                  width:double.infinity,
                                  child: FrElevatedButton(
                                      name: "Change Password",
                                      onPressed: controller.formSubmit
                                  ),
                                ),
                                SmallSpacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }



  @override
  void loadDependentLogics() {
    Get.lazyPut<ChangePasswordLogic>(() => ChangePasswordLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return ChangePasswordI18N.getTranslations();
  }
}
