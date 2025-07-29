import 'package:cowmaster/page/add_cattle/add_cattle_view.dart';
import 'package:cowmaster/page/bottom_nav/bottom_nav_view.dart';
import 'package:cowmaster/page/cattle_details/cattle_details_view.dart';
import 'package:cowmaster/page/cattle_list/cattle_list_view.dart';
import 'package:cowmaster/page/notification_list/notifiction_list_view.dart';
import 'package:cowmaster/page/profile/profile_view.dart';
import 'package:cowmaster/page/edit_profile/edit_profile_view.dart';
import 'package:cowmaster/page/report_list/report_list_view.dart';
import 'package:cowmaster/page/settings/setting_view.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'page/change_password/change_password_view.dart';
import 'page/home/home_view.dart';
import 'page/login/login_view.dart';
import 'page/registration/registration_view.dart';
import 'page/reset_password/reset_password_view.dart';

class Registry extends RapidModuleRegistry {
  @override
  List<RapidView> getPages() {
    return [
      const BottomNavView(),
      const HomeView(),
      const CattleListView(),
      const NotifictionListView(),
      const ReportListView(),
      const LoginView(),
      const RegistrationView(),
      const ResetPasswordView(),
      const ChangePasswordView(),
      const ProfileView(),
      const EditProfileView(),
      const AddCattleView(),
      const SettingView(),
      const CattleDetailsView(),
    ];
  }
}