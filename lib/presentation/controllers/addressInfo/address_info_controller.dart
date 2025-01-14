import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../src/core/routes/routes.dart';
import '../../widgets/states_enum.dart';

class AddressController extends GetxController{
  var selectedState = States.Maharashtra.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final addressTextController = TextEditingController().obs;
  final landmarkTextController = TextEditingController().obs;
  final cityTextController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;


  void updateState(States newValue) {
    selectedState.value = newValue;
  }

  void submitYourAddress() {
    if (formKey.currentState!.validate()) {
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
                print("OK Pressed");
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }



}