import 'dart:io';

import 'package:cowmaster/page/edit_profile/edit_profile_i18n.dart';
import 'package:flutter_laravel_form_validation/flutter_laravel_form_validation.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../config/app_theme.dart';
import '../../layouts/editable_image_picker.dart';
import '../../layouts/sizebox_widgets.dart';
import '../../layouts/text_widgets.dart';
import 'package:intl/intl.dart';

import 'edit_profile_logic.dart';

class EditProfileView extends RapidView<EditProfileLogic> {
  static String routeName = "/EditProfile";

  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      backgroundColor: Theme.of(context).primaryColor,
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
                      buildEditProfileForm(context)
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

  Widget buildEditProfileForm(BuildContext context) {
    return Obx(
      ()=> Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            autovalidateMode: controller.formValidateMode.value,
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    MediumSpacer()
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.edit),
                        ),
                        controller: controller.formController['firstName'],
                        validator: [
                          FLValidator.required
                        ].validate(),
                      ),
                    ),
                    SizedBox(width: AppSize.small,),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.edit),
                        ),
                        controller: controller.formController['lastName'],
                        validator: [
                          FLValidator.required
                        ].validate(),
                      ),
                    ),
                  ],
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
                    prefixIcon: Icon(Icons.phone_android),
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  controller: controller.formController['dateOfBirth'],
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_today),
                      labelText: "Date of Birth",
                      hintText: 'Select Date'
                  ),
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                  readOnly: true,
                  onTap: () async {
                    print("Date is not selected");
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now()
                    );
                    if(pickedDate != null ){
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                      controller.formController['dateOfBirth']!.text = formattedDate;
                    } else{
                      print("Date is not selected");
                    }
                  },
                ),
                XXSmallSpacer(),

                NormalText('Gender'),
                Stack(
                  children: [
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: controller.formController['gender'],
                      validator: [
                        FLValidator.required,
                        FLValidator.interger
                      ].validate(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Male"),
                            value: 'male',
                            groupValue: controller.gender.value,
                            onChanged: (value){
                              controller.formController['gender']!.text = value.toString();
                              controller.gender.value = value!;
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: const Text("Female"),
                            value: 'female',
                            groupValue: controller.gender.value,
                            onChanged: (value){
                              controller.formController['gender']!.text = value.toString();
                              controller.gender.value = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SmallSpacer(),
          
                SizedBox(
                  width:double.infinity,
                  child: FrElevatedButton(
                      name: "Update Profile",
                      onPressed: controller.formSubmit
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  @override
  void loadDependentLogics() {
    Get.lazyPut<EditProfileLogic>(() => EditProfileLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return EditProfileI18N.getTranslations();
  }
}
