import 'dart:io';

import 'package:flutter_laravel_form_validation/extensions/extensions.dart';
import 'package:flutter_laravel_form_validation/laravel_validation_rules.dart';
import 'package:flutter_rapid/flutter_rapid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:intl/intl.dart';
import '../../config/app_theme.dart';
import '../../layouts/editable_image_picker.dart';
import '../../layouts/header_widget.dart';
import '../../layouts/shimmer_image_view.dart';
import '../../layouts/text_widgets.dart';
import '../../page/change_password/change_password_view.dart';
import '../../page/reset_password/reset_password_view.dart';
import '../../layouts/round_icon_button.dart';
import '../../layouts/sizebox_widgets.dart';
import '../login/login_view.dart';
import 'add_cattle_i18n.dart';
import 'add_cattle_logic.dart';


class AddCattleView extends RapidView<AddCattleLogic> {
  static String routeName = "/AddCattleView";

  const AddCattleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Cattle')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildAddCattleForm(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddCattleForm(BuildContext context) {
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: controller.formController['name'],
                  validator: [
                    FLValidator.required
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Ear Tag',
                  ),
                  controller: controller.formController['name'],
                  validator: [
                    FLValidator.required
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mobile',
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
                SmallText('Gender'),
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
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Breed',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Dam Ear Tag',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Sire, Name, Tag',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                  ),
                  controller: controller.formController['mobile'],
                  validator: [
                    FLValidator.required,
                    FLValidator.interger
                  ].validate(),
                ),
                SmallSpacer(),

                SizedBox(
                  width:double.infinity,
                  child: FrElevatedButton(
                      name: "Add Cattle",
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
    Get.lazyPut<AddCattleLogic>(() => AddCattleLogic());
  }

  @override
  String getRouteName() {
    return routeName;
  }

  @override
  Map<String, Map<String, String>> getI18n() {
    return AddCattle18N.getTranslations();
  }
}

