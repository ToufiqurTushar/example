import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';

class RegistrationLogic extends RapidStartLogic {
  var formKey = GlobalKey<FormState>();
  var formController = {
    'mobile': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
    'username': TextEditingController(),
  };
  var formValidateMode = AutovalidateMode.disabled.obs;
  var isCheckedAggrement = true.obs;
  
  
  var hasVerificationCode = false.obs;
  var formVerifyKey = GlobalKey<FormState>();
  var formVerifyController = {
    'verification_code': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
    'mobile': TextEditingController(),
    'referralCode': TextEditingController()
  };
  var formVerifyValidateMode = AutovalidateMode.disabled.obs;
  var isVerificationCodeInput = false.obs;

  @override
  void onInit() {
    super.onInit();

  }

  void formSubmit() {
    final data = formController.data();
    if (!formKey.currentState!.validate()) {
      formValidateMode.value = AutovalidateMode.always;
      return ;
    }
    hasVerificationCode.value = true;
    RLog.info(data);
  }

  void formVerifySubmit() {
    final data = formVerifyController.data();
    if (!formVerifyKey.currentState!.validate()) {
      formVerifyValidateMode.value = AutovalidateMode.always;
      return ;
    }

    RLog.info(data);
  }
}