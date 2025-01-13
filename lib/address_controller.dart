

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/state_enum.dart';

class AddressController extends GetxController{
  var selectedState = States.Maharashtra.obs;

  final addressTextController = TextEditingController().obs;
  final landmarkTextController = TextEditingController().obs;
  final cityTextController = TextEditingController().obs;
  final zipCodeController = TextEditingController().obs;


  void updateState(States newValue) {
    selectedState.value = newValue;
  }


}