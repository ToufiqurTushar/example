import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';

class EditProfileLogic extends RapidStartLogic {
  var formKey = GlobalKey<FormState>();
  var formController = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'mobile': TextEditingController(),
    'dateOfBirth': TextEditingController(),
    'gender': TextEditingController()
  };
  var formValidateMode = AutovalidateMode.disabled.obs;
  var name = 'Touhid Mia'.obs;
  var gender = "".obs;
  @override
  void onInit() {
    super.onInit();

  }

  void formSubmit() {
    globalState.toggleThemeMode();
    final data = formController.data();
    if (!formKey.currentState!.validate()) {
      formValidateMode.value = AutovalidateMode.always;
      return ;
    }

    RLog.info(data);
  }


}