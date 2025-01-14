import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:neosoft_task/domain/usecases/address/address_usecases.dart';

import '../../../data/models/registration_model.dart';
import '../../../src/core/routes/routes.dart';
import '../../../src/core/utils/database/database_helper.dart';
import '../../widgets/states_enum.dart';
import '../basicInfo/basic_info_controller.dart';
import '../completeInfo/complete_info_controller.dart';

class AddressController extends GetxController{
  final AddressUseCases addressUseCases;
  AddressController(this.addressUseCases);


  var selectedState = States.Maharashtra.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final addressTextController = TextEditingController().obs;
  final landmarkTextController = TextEditingController().obs;
  final cityTextController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;


  @override
  void onClose() {
    addressTextController.value.dispose();
    landmarkTextController.value.dispose();
    cityTextController.value.dispose();
    zipCodeController.value.dispose();
  }

  void clearAllField(){
    addressTextController.value.clear();
    landmarkTextController.value.clear();
    cityTextController.value.clear();
    zipCodeController.value.clear();
  }

  Map<String, String> getAddressDetails() {
    return {
      'address': addressTextController.value.text,
      'zipCode': zipCodeController.value.text,
      'city':cityTextController.value.text,
      'landmark':landmarkTextController.value.text
    };
  }



  Future<void> saveData() async {

   bool saved=await  addressUseCases.saveRegistrationData() ?? false;

   if(saved==true){
     Get.dialog(
       AlertDialog(
         title: Text("Success"),
         content: Text("Registration done successfully"),
         actions: [
           TextButton(
             onPressed: () => Get.back(),
             child: Text("Cancel"),
           ),
           ElevatedButton(
             onPressed: () {
               Get.find<RegistrationController>().clearAllField();
               Get.find<EducationController>().clearAllField();
               clearAllField();
               Get.toNamed(Routes.basicInfoPage);
             },
             child: Text("OK"),
           ),
         ],
       ),
     );
   }else{
     Get.dialog(
       AlertDialog(
         title: Text("Failure"),
         content: Text("Registration Note done successfully"),
         actions: [
           ElevatedButton(
             onPressed: () {
               Get.back();
             },
             child: Text("OK"),
           ),
         ],
       ),
     );
   }
  }



  void updateState(States newValue) {
    selectedState.value = newValue;
  }

  void submitYourAddress() {
    if (formKey.currentState!.validate()) {
      saveData();
    }
  }



}