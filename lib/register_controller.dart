import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'complete_info.dart';

class RegistrationController extends GetxController{
  List gender=["Male","Female","Other"];
  final select = ''.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final ImagePicker picker = ImagePicker();
  var selectedImagePath = ''.obs;

  void SubmitRegistration() {
    if (formKey.currentState!.validate()) {
      Get.to(ProfessionalInfoPage());
    }
  }


  void showImagePickerOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () {
                pickImage(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () {
                pickImage(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }


  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImagePath.value = image.path;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }


  void onRadioButtonChange(dynamic value){
    select.value=value;
  }

}