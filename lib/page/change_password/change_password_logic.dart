import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';

class ChangePasswordLogic extends RapidStartLogic {
  var formKey = GlobalKey<FormState>();
  var formController = {
    'currentNewPassword': TextEditingController(),
    'newPassword': TextEditingController(),
    'confirmNewPassword': TextEditingController()
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