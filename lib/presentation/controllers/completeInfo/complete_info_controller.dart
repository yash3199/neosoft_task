import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:neosoft_task/src/core/routes/routes.dart';

import '../../widgets/education_enum.dart';

class EducationController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var selectedEducation = EducationLevel.graduate.obs;
  var selectedYear = DateTime.now().year.obs;
  List<int> yearList = [];
  final gradeController = TextEditingController().obs;
  final experienceController = TextEditingController().obs;
  final designationController = TextEditingController().obs;
  final domainController = TextEditingController().obs;


  @override
  void onInit() {
    super.onInit();
    generateYearList();
  }


  void submitYourInfo() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.addressInfoPage);

    }
  }



  void updateEducation(EducationLevel newValue) {
    selectedEducation.value = newValue;
  }

  void generateYearList() {
    int currentYear = DateTime.now().year;
    for (int year = 1980; year <= currentYear; year++) {
      yearList.add(year);
    }
  }

  void updateYear(int? newYear) {
    if (newYear != null) {
      selectedYear.value = newYear;
    }
  }
}
