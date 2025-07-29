import 'dart:io';

import 'package:cowmaster/page/add_cattle/add_cattle_view.dart';
import 'package:cowmaster/page/profile/profile_i18n.dart';
import 'package:cowmaster/page/profile/profile_logic.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import '../../config/app_theme.dart';
import '../../layouts/editable_image_picker.dart';
import '../../layouts/header_widget.dart';
import '../../layouts/shimmer_image_view.dart';
import '../../layouts/text_widgets.dart';
import '../../page/change_password/change_password_view.dart';
import '../../page/reset_password/reset_password_view.dart';
import '../../layouts/round_icon_button.dart';
import '../../layouts/sizebox_widgets.dart';
import '../edit_profile/edit_profile_view.dart';
import '../login/login_view.dart';
import '../settings/setting_view.dart';


class ProfileView extends RapidView<ProfileLogic> {
  static String routeName = "/ProfileView";

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(title: Text('My Profile'), actions: [
          IconButton(onPressed:()=>Get.toNamed(SettingView.routeName), icon: Icon(Icons.settings))
        ],),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MediumSpacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment .center,
                  children: [
                    EditableImagePicker(
                      size: 130,
                      initialImage: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=400&q=80',
                      onChange: (File file){
                        RLog.error(file.path);
                      },
                    ),
                    Text(controller.name.value)
                  ],
                ),
                MediumSpacer(),

                HeaderWidget(
                  headerMargin: EdgeInsets.all(4),
                  backgroundColor: Color(0xfff7faeb),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment .start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.1), child: Icon(Icons.person, color: Colors.grey),),
                        title: NormalText("Profile Details"),
                        dense: true,
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16,),
                        onTap: ()=>Get.toNamed(EditProfileView.routeName),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.1), child: Icon(Icons.password, color: Colors.grey),),
                        title: NormalText("Password"),
                        dense: true,
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16,),
                        onTap: ()=>Get.toNamed(ChangePasswordView.routeName),
                      ),
                    ],
                  ),
                ),
                MediumSpacer(),

                HeaderWidget(
                  headerMargin: EdgeInsets.all(4),
                  backgroundColor: Color(0xfff7faeb),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment .start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(backgroundColor: Colors.grey.withOpacity(0.1), child: Icon(Icons.logout, color: Colors.grey),),
                        title: NormalText("Logout"),
                        dense: true,
                        onTap:()=> Get.offAllNamed(LoginView.routeName)
                      ),
                    ],
                  ),
                ),
                MediumSpacer(),
                // Row(
                //   children: [
                //     Expanded(
                //       child: ListTile(
                //         dense: true,
                //         onTap: ()=>Get.toNamed(ChangePasswordView.routeName),
                //         leading: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                //         title: const Text('Change Password'),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(6),
                //           side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: AppSize.small,),
                //     Expanded(
                //       child: ListTile(
                //         onTap: ()=>Get.toNamed(EditProfileView.routeName),
                //         leading: Icon(Icons.logout, color: Theme.of(context).primaryColor,),
                //         title: const Text('Logout'),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(6),
                //           side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                //
                //
                // HeaderWidget(
                //   title: "Package Information",
                //   icon: Icons.refresh,
                //   onTap: ()=>Get.toNamed(EditProfileView.routeName),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment .start,
                //     children: [
                //       ListTile(
                //         dense: true,
                //         onTap: ()=>Get.toNamed(ChangePasswordView.routeName),
                //         leading: Icon(Icons.group, color: Theme.of(context).primaryColor,),
                //         title: NormalText('Medium Package'),
                //         subtitle: Text('60 cattle'),
                //       ),
                //       Row(
                //         children: [
                //           Expanded(
                //             child: ListTile(
                //               dense: true,
                //               onTap: ()=>Get.toNamed(ChangePasswordView.routeName),
                //               leading: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                //               title: const Text('60 cattles recorss'),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(6),
                //                 side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                //               ),
                //             ),
                //           ),
                //           SizedBox(width: AppSize.small,),
                //           Expanded(
                //             child: InkWell(
                //               onTap: ()=>Get.toNamed(EditProfileView.routeName),
                //               child: Container(
                //                 height: 58,
                //                 decoration: BoxDecoration(
                //                   color: Theme.of(context).primaryColor,
                //                   borderRadius: BorderRadius.circular(8),
                //                 ),
                //                 child: Row(
                //                   children: [
                //                     Expanded(child: Padding(
                //                       padding: const EdgeInsets.only(left: 8.0),
                //                       child: NormalText("Package Details", color: Colors.black,),
                //                     )),
                //                     Icon(Icons.chevron_right_outlined, color: Colors.white,)
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                //
                //
                // HeaderWidget(
                //   title: "User List",
                //   icon: Icons.add,
                //   onTap: ()=>Get.toNamed(AddCattleView.routeName),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment .start,
                //     children: [
                //         TextButton(onPressed: ()=>Get.toNamed(AddCattleView.routeName), child: Text('Add Cattle'))
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  void loadDependentLogics() {
    Get.lazyPut<ProfileLogic>(() => ProfileLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return Profile18N.getTranslations();
  }


}
