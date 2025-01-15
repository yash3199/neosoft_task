import 'package:get/get.dart';
import 'package:neosoft_task/presentation/controllers/completeInfo/complete_info_controller.dart';
import 'package:flutter/material.dart';

import '../../../src/core/routes/routes.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_dropdown.dart';
import '../../widgets/common_textfield.dart';
import '../../widgets/education_enum.dart';

class ProfessionalInfoPage extends GetView<EducationController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: SafeArea(
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
                    Expanded(child: Center(child: Text("Your Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),

                  ],
                ),
                SizedBox(height: 30.0,),
                Text("Education Info",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 10.0,),
                Form(
                  key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return CommonDropdown<EducationLevel>(
                            aboveText: 'Education*',
                            labelText: 'Select your qualification',
                            selectedValue: controller.selectedEducation.value,
                            enumValues: EducationLevel.values,
                            onChanged: (value) {
                              if (value != null) {
                                controller.selectedEducation.value = value;
                              }
                            },
                          );
                        }),
                        SizedBox(height: 10.0,),
                        Text("Year of passing*", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        Obx(() {
                          return DropdownButtonFormField<int>(
                            value: controller.selectedYear.value,
                            decoration: InputDecoration(
                              hintText: 'Year of Passing',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            icon: Icon(Icons.arrow_drop_down,color: Colors.blue[900],size: 30,),
                            items: controller.yearList.map((year) {
                              return DropdownMenuItem<int>(
                                value: year,
                                child: Text(year.toString()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.updateYear(value);
                            },
                          );
                        }),
                        SizedBox(height: 10.0,),
                        TextFormFieldCommon(controller: controller.gradeController.value,
                          labelText: 'Enter your grade or percentage',
                          validator:
                              (value) {
                            if (value == null  || !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                              return 'Enter a valid grade that is in character only';
                            }
                            return null;
                          },
                          prefixIcon: null,
                          aboveText: "Grade*",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0,),
                        Divider(color: Colors.grey,),
                        SizedBox(height: 8.0,),
                        Text("professional Info",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10.0,),
                        TextFormFieldCommon(
                          controller: controller.experienceController.value,
                          labelText: 'Enter your 10 digit phone number',
                          validator:(value) {
                            if (value == null  || !RegExp(r'^[0-9]{1}$').hasMatch(value)) {
                              return 'Enter a valid experience';
                            }
                            return null;
                          },
                          prefixIcon: null,
                          aboveText: "Experience*",
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 10.0,),
                        TextFormFieldCommon(
                          controller: controller.designationController.value,
                          labelText: 'Select Designation',
                          validator:
                              (value) {
                            if (value == null  || !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                              return 'Enter a valid designation only accept characters';
                            }
                            return null;
                          },
                          prefixIcon: null,
                          aboveText: "Designation*",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 10.0,),
                        TextFormFieldCommon(
                          controller: controller.domainController.value,
                          labelText: 'Select your Domain',
                          validator:
                              (value) {
                            if (value == null  || !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                              return 'Enter a valid domain only accept characters';
                            }
                            return null;
                          },
                          prefixIcon: null,
                          aboveText: "Domain*",
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15.0,),
                        Row(
                          children: [
                            Expanded(
                                child:Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: CommonButton(
                                    text: "Prev",
                                    onTap: (){
                                      Get.back();
                                    },
                                  ),
                                )
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: CommonButton(
                                      onTap: (){
                                        controller.submitYourInfo();
                                      },
                                      text: "Next"
                                  ),
                                )
                            ),
                          ],
                        )
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
