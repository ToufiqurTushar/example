import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';

class ResetPasswordLogic extends RapidStartLogic {
  var formKey = GlobalKey<FormState>();
  var formController = {
    'userName': TextEditingController(),
    'password': TextEditingController()
  };
  var formValidateMode = AutovalidateMode.disabled.obs;

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

    RLog.info(data);
  }


}