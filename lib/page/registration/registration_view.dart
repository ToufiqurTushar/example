import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';
import '../../config/app_theme.dart';
import '../../layouts/text_widgets.dart';
import '../../page/login/login_view.dart';
import '../../layouts/sizebox_widgets.dart';
import 'registration_i18n.dart';
import 'registration_logic.dart';


class RegistrationView extends RapidView<RegistrationLogic> {
  static String routeName = "/registration";
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Registration')),
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
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset('assets/ic_launcher.png', height: 100, width: 100,)
                            ),
                            XLargeText("GoruGo", isBold: true,),
                            NormalText("Cattle Hard Management System", color: Colors.grey,),
                            NormalSpacer(),
                            !controller.hasVerificationCode.value ?
                            buildRegistrationForm(context) :
                            buildVerifyForm(context),
                          ],
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

  Widget buildRegistrationForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        autovalidateMode: controller.formValidateMode.value,
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Mobile',
                prefixIcon: Icon(Icons.phone_android),
              ),
              controller: controller.formController['mobile'],
              validator: [
                FLValidator.required
              ].validate(),
            ),
            NormalSpacer(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              controller: controller.formController['password'],
              validator: [
                FLValidator.required
              ].validate(),
            ),
            NormalSpacer(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Repeat Password',
                prefixIcon: Icon(Icons.lock),
              ),
              controller: controller.formController['confirmPassword'],
              validator: [
                FLValidator.required
              ].validate(),
            ),
            NormalSpacer(),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Dairy Name or Username',
                prefixIcon: Icon(Icons.edit),
              ),
              controller: controller.formController['username'],
              validator: [
                FLValidator.required,
                FLValidator.interger
              ].validate(),
            ),
            NormalSpacer(),
            SizedBox(
              width:double.infinity,
              child: FrElevatedButton(
                  name: "Sign Up",
                  onPressed: !controller.isCheckedAggrement.value ? (){} : controller.formSubmit
              ),
            ),
            NormalSpacer(),
            SmallText('Already have an account?', isCenter: true,),
            TextButton(
              onPressed: ()=> Get.offAllNamed(LoginView.routeName),
              child: Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize:16, color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerifyForm(BuildContext context) {
    return Form(
      autovalidateMode: controller.formVerifyValidateMode.value,
      key: controller.formVerifyKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LargeText('Verify Your Number'),
          SizedBox(height: AppSize.normal),
          SmallText('A Code has been sent to your number.Please check messages and enter here'),
          SizedBox(height: AppSize.xxxLarge),
          OtpTextField(
            numberOfFields: 5,
            showFieldAsBox: true,
            focusedBorderColor: Theme.of(context).primaryColor,
            borderColor: Colors.grey,
            onCodeChanged: (String code) {
              if(code.isEmpty) {
                controller.isVerificationCodeInput.value = false;
              }
            },
            onSubmit: (String verificationCode){
              controller.isVerificationCodeInput.value = true;
              controller.formVerifyController['verification_code']!.text = verificationCode;
            }, // end onSubmit
          ),
          SizedBox(height: AppSize.xxxLarge),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            obscureText: true,
            controller: controller.formVerifyController['password'],
            validator: [
              FLValidator.required
            ].validate(),
          ),
          SmallSpacer(),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
            ),
            obscureText: true,
            controller: controller.formVerifyController['confirmPassword'],
            validator: [
              FLValidator.required,
              FLValidator.same(controller.formVerifyController['password']!.text)
            ].validate(
              customMessages: {
                'same': "Confirm Password doesn't match"
              }
            ),
          ),
          SmallSpacer(),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Mobile',
            ),
            controller: controller.formVerifyController['mobile'],
            validator: [
              FLValidator.required,
              FLValidator.email
            ].validate(),
          ),
          SmallSpacer(),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Referral Code',
            ),
            controller: controller.formVerifyController['referralCode'],
          ),
          SmallSpacer(),
          SizedBox(
            width:double.infinity,
            child: FrElevatedButton(
                name: "Complete Registration",
                onPressed: controller.isVerificationCodeInput.value ? controller.formVerifySubmit : (){}
            ),
          ),
          LargeSpacer(),
        ],
      ),
    );
  }

  @override
  void loadDependentLogics() {
    Get.lazyPut<RegistrationLogic>(() => RegistrationLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return RegistrationI18N.getTranslations();
  }
}
