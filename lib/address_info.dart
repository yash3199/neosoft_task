import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/address_controller.dart';
import 'package:neosoft_task/state_enum.dart';

import 'common_dropdown.dart';
import 'common_textform_field.dart';

class AddressInfo extends GetView<AddressController> {
  const AddressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.0,),
            Row(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.arrow_back,size: 30,),
                ),
                Expanded(child: Center(child: Text("Your Address",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
              ],
            ),
            SizedBox(height: 30.0,),
            TextFormFieldCommon(controller: controller.addressTextController.value,
              labelText: 'Adress',
              validator:
                  (value) {
                if (value == null  || value.length<3) {
                  return 'Enter a correct address';
                }
                return null;
              },
              prefixIcon: Icons.location_city,
              keyboardType: TextInputType.text,
            ),
            TextFormFieldCommon(
              controller: controller.landmarkTextController.value,
              labelText: 'Landmark',
              validator:
                  (value) {
                if (value == null  || value.length<3) {
                  return 'Enter a correct Landmark';
                }
                return null;
              },
              prefixIcon: Icons.location_city,
              keyboardType: TextInputType.text,
            ),
            TextFormFieldCommon(
              controller: controller.cityTextController.value,
              labelText: 'City',
              validator:
                  (value) {
                if (value == null) {
                  return 'Enter a correct City';
                }
                return null;
              },
              prefixIcon: Icons.location_city,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.0,),
            Obx(() {
              return CommonDropdown<States>(
                aboveText: null,
                labelText: 'Select your state',
                selectedValue: controller.selectedState.value,
                enumValues: States.values,
                onChanged: (value) {
                  if (value != null) {
                    controller.selectedState.value = value;
                  }
                },
              );
            }),
            TextFormFieldCommon(
              controller: controller.zipCodeController.value,
              labelText: 'Pin code',
              validator:
                  (value) {
                    if (value == null || value.isEmpty) {
                      return 'Zip Code is required';
                    }
                    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
                      return 'Zip Code must be a 6-digit number';
                    }
                    return null;
              },
              prefixIcon: Icons.location_city,
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 25.0,),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child:
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: Center(
                      child: Text("Submit", style: TextStyle(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.bold),)),
                ),

              ),
            ),





          ],
        ),
      ),
    );;
  }
}
