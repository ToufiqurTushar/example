import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';
import '../../config/app_theme.dart';
import '../../layouts/text_widgets.dart';
import '../../page/registration/registration_view.dart';
import '../../page/reset_password/reset_password_view.dart';
import '../../layouts/sizebox_widgets.dart';
import 'login_i18n.dart';
import 'login_logic.dart';


class LoginView extends RapidView<LoginLogic> {
  static String routeName = "/login";

  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Obx(
              ()=> SingleChildScrollView(
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
                                  LargeText("Login", isBold: true,),
                                  XLargeSpacer(),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Mobile',
                                      prefixIcon: Icon(Icons.phone_android),
                                    ),
                                    controller: controller.formController['userName'],
                                    validator: [
                                      FLValidator.required
                                    ].validate(),
                                  ),
                                  LargeSpacer(),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                          onPressed: (){
                                            controller.paswwordVisibility.value = !controller.paswwordVisibility.value;
                                          },
                                          icon: Icon(controller.paswwordVisibility.value?Icons.visibility: Icons.visibility_off)
                                      ),
                                    ),
                                    controller: controller.formController['password'],
                                    obscureText: !controller.paswwordVisibility.value,
                                    validator: [
                                      FLValidator.required
                                    ].validate(),
                                  ),
                                  SmallSpacer(),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: controller.remeberLogin.value,
                                        onChanged: (val) {
                                          controller.remeberLogin.value = !controller.remeberLogin.value;
                                        },
                                      ),
                                      NormalText('Remember me'),
                                      const Spacer(),
                                      InkWell(
                                          onTap: ()=> Get.toNamed(ResetPasswordView.routeName),
                                          child: const Text('Forgot Password?', style: TextStyle(color: Colors.red))
                                      )
                                    ],
                                  ),
                                  SmallSpacer(),
                                  SizedBox(
                                    width:double.infinity,
                                    child: ElevatedButton(
                                      onPressed: controller.formSubmit,
                                      child: const Text("Login"),
                                    ),
                                  ),
                                  LargeSpacer(),
                                  SmallText('or, Create new Account', isCenter: true,),
                                  TextButton(
                                    onPressed: ()=> Get.toNamed(RegistrationView.routeName),
                                    child:Text('Register', style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),),
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
              ),
            );
          },
        ),
      ),
    );
  }



  @override
  void loadDependentLogics() {
    Get.lazyPut<LoginLogic>(() => LoginLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return LoginI18N.getTranslations();
  }
}
