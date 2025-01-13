import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'education_option_enum.dart';

class EducationController extends GetxController {
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




