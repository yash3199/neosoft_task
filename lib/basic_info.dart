import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:neosoft_task/register_controller.dart';

import 'common_textform_field.dart';

class BasicInfoPage extends GetView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0,left: 16.0,top: 10.0,bottom: 5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25.0,),
              Text("Register",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Obx(() {
                      return Stack(
                        children: [
                          // Circle Avatar for displaying the selected image
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: controller.selectedImagePath.value.isNotEmpty
                                ? FileImage(File(controller.selectedImagePath.value))
                                : AssetImage('assets/default_avatar.png') as ImageProvider,
                          ),
                          // Pencil button for picking an image
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => controller.showImagePickerOptions(),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.edit, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 15.0,),
                    TextFormFieldCommon(controller: controller.firstNameController.value,labelText: 'Enter your first name here',validator:
                        (value) {
                      if (value == null || value.length < 3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                      prefixIcon: Icons.person,
                      aboveText: "First Name*",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 12.0,),
                    TextFormFieldCommon(controller: controller.lastNameController.value,labelText: 'Enter your last name here',validator:
                        (value) {
                      if (value == null || value.length < 3 || !RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                      prefixIcon: Icons.person,
                      aboveText: "Last Name*",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 12.0,),
                    TextFormFieldCommon(controller: controller.mobileNumberController.value,
                      labelText: 'Enter your 10 digit phone number',
                      validator:(value) {
                        if (value == null || value.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Enter a valid 10-digit mobile number';
                        }
                        return null;
                      },
                      prefixIcon: Icons.phone,
                      aboveText: "Phone Number*",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 12.0,),
                    TextFormFieldCommon(controller: controller.emailController.value,
                      labelText: 'Your email goes here',
                      validator:(value) {
                        if (value == null || !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                          return 'Enter a valid email id';
                        }
                        return null;
                      },
                      prefixIcon: Icons.email,
                      aboveText: "Email*",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 12.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Obx(()=> Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: Colors.blue[900],
                                  value: controller.gender[0],
                                  groupValue: controller.select.value,
                                  onChanged: (value){
                                    if(value!=null){
                                      controller.onRadioButtonChange(value);
                                    }
                                  },
                                ),
                                Text('Male',style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  activeColor: Colors.blue[900],
                                  value: controller.gender[1],
                                  groupValue: controller.select.value,
                                  onChanged: (value){
                                    if(value!=null){
                                      controller.onRadioButtonChange(value);
                                    }
                                  },
                                ),
                                Text('Female',style: TextStyle(fontSize: 18),),
                              ],
                            ),
                          ],
                        ))

                      ],
                    ),
                    SizedBox(height: 12.0,),
                    TextFormFieldCommon(controller: controller.passwordController.value,
                      labelText: 'password',
                      validator:(value) {
                        if (value == null || !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility_off,
                      aboveText: "Password*",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(height: 12.0,),
                    TextFormFieldCommon(controller: controller.confirmPasswordController.value,
                      labelText: 'password',
                      validator:(value) {
                        if (value == null || !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
                          return 'Enter a valid password';
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock,
                      aboveText: "Confirm Password*",
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: GestureDetector(
                        onTap: () {controller.SubmitRegistration();},
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

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
