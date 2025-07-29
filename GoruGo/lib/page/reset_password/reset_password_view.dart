import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';
import '../../config/app_theme.dart';
import '../../layouts/text_widgets.dart';
import '../../page/registration/registration_view.dart';
import '../../layouts/sizebox_widgets.dart';
import '../login/login_view.dart';
import 'reset_password_i18n.dart';
import 'reset_password_logic.dart';


class ResetPasswordView extends RapidView<ResetPasswordLogic> {
  static String routeName = "/reset_password";

  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Reset Password')),
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
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: controller.formKey,
                            autovalidateMode: controller.formValidateMode.value,
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset('assets/ic_launcher.png', height: 100, width: 100,)
                                ),
                                XLargeText("GoruGo", isBold: true,),
                                NormalText("Cattle Hard Management System", color: Colors.grey,),
                                NormalSpacer(),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Mobile',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  controller: controller.formController['mobile'],
                                  validator: [
                                    FLValidator.required
                                  ].validate(),
                                ),

                                SmallSpacer(),

                                SizedBox(
                                  width:double.infinity,
                                  child: FrElevatedButton(
                                      name: "Reset Password",
                                      onPressed: controller.formSubmit
                                  ),
                                ),
                                SmallSpacer(),
                                SmallText('Back to Login', isCenter: true,),
                                SizedBox(
                                  width:double.infinity,
                                  child: FrElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                                    ),
                                    onPressed: ()=> Get.offAllNamed(LoginView.routeName),
                                    name: 'Login',
                                  ),
                                ),
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
    Get.lazyPut<ResetPasswordLogic>(() => ResetPasswordLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return ResetPasswordI18N.getTranslations();
  }
}
