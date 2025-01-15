import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controllers/addressInfo/address_info_controller.dart';
import '../../widgets/common_dropdown.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/states_enum.dart';

class AddressInfo extends GetView<AddressController> {
  const AddressInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back,size: 30,),
                  ),
                  Expanded(child: Center(child: Text("Your Address",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
                ],
              ),
              SizedBox(height: 30.0,),
              Form(
                key: controller.formKey,
                  child: Column(
                    children: [
                      TextFormFieldCommon(controller: controller.addressTextController.value,
                        labelText: 'Adress',
                        onTap: (){},
                        validator:
                            (value) {
                          if (value == null  || value.length<3) {
                            return 'Enter a correct address with more than 3 characters';
                          }
                          return null;
                        },
                        prefixIcon: Icons.location_city,
                        keyboardType: TextInputType.text,
                      ),
                      TextFormFieldCommon(
                        controller: controller.landmarkTextController.value,
                        onTap: (){},
                        labelText: 'Landmark',
                        validator:
                            (value) {
                          if (value == null  || value.length<3) {
                            return 'Enter a correct Landmark with more than 3 characters';
                          }
                          return null;
                        },
                        prefixIcon: Icons.location_city,
                        keyboardType: TextInputType.text,
                      ),
                      TextFormFieldCommon(
                        controller: controller.cityTextController.value,
                        onTap: (){},
                        labelText: 'City',
                        validator:
                            (value) {
                          if (value == null || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                            return 'Enter a correct City with character only';
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
                        onTap: (){},
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
                            controller.submitYourAddress();
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
                  )

              )




            ],
          ),
        ),
      ),
    );;
  }
}
