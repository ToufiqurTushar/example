import 'package:cowmaster/page/home/home_view.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import '../../common/app_extenstion.dart';
import '../bottom_nav/bottom_nav_view.dart';
import '../profile/profile_view.dart';

class LoginLogic extends RapidStartLogic {
  var formKey = GlobalKey<FormState>();
  var formController = {
    'userName': TextEditingController(),
    'password': TextEditingController()
  };
  var formValidateMode = AutovalidateMode.disabled.obs;
  var paswwordVisibility = false.obs;
  var remeberLogin = false.obs;

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
    Get.toNamed(BottomNavView.routeName);
  }


}