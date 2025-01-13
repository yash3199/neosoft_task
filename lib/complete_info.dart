import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neosoft_task/address_info.dart';
import 'package:neosoft_task/education_controller.dart';

import 'common_dropdown.dart';
import 'common_textform_field.dart';
import 'education_option_enum.dart';

class ProfessionalInfoPage extends GetView<EducationController> {

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
              Expanded(child: Center(child: Text("Your Info",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),

            ],
          ),
          SizedBox(height: 30.0,),
          Text("Education Info",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 10.0,),
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
              return 'Enter a valid grade';
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
                return 'Enter a valid destination';
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
                return 'Enter a valid domain';
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
              Expanded(child:Padding(
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
                        child: Text("Prev", style: TextStyle(color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),

                ),
              )
              ),
              SizedBox(width: 12,),
              Expanded(child:Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: GestureDetector(
                  onTap: () {
                   Get.to(AddressInfo());
                  },
                  child:
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                    ),
                    child: Center(
                        child: Text("Next", style: TextStyle(color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),)),
                  ),

                ),
              )
              ),


            ],
          )




        ],
      ),
    ),
    );
  }
}
