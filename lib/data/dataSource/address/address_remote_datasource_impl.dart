import 'package:get/get.dart';
import 'package:neosoft_task/data/dataSource/address/address_remote_datasource.dart';

import '../../../presentation/controllers/addressInfo/address_info_controller.dart';
import '../../../presentation/controllers/basicInfo/basic_info_controller.dart';
import '../../../presentation/controllers/completeInfo/complete_info_controller.dart';
import '../../../src/core/utils/database/database_helper.dart';
import '../../models/registration_model.dart';

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {

  Future<bool?> saveRegistrationData() async {

    final basicDetailsController = Get.find<RegistrationController>();
    final educationalDetailsController = Get.find<EducationController>();
    final addressDetailsController = Get.find<AddressController>();

    final basicDetails = basicDetailsController.getBasicDetails();
    final educationalDetails = educationalDetailsController.getEducationDetails();
    final addressDetails = addressDetailsController.getAddressDetails();

    final registration = RegistrationModel(
        firstName: basicDetails['firstName']!,
        lastName: basicDetails['lastName']!,
        email: basicDetails['email']!,
        mobileNumber: basicDetails['mobileNumber']!,
        yearOfPassing: int.parse(educationalDetails['yearOfPassing']??"2025"),
        grade: educationalDetails['grade']!,
        address: addressDetails['address']!,
        zipCode: addressDetails['zipCode']!,
        password: basicDetails['password']!,
        designation: educationalDetails['designation']!,
        domain: educationalDetails['domain']!,
        city: addressDetails['city']!,
        landmark: addressDetails['landmark']!,
        experience: int.parse(educationalDetails['experience']!)
    );


    final dbHelper = DatabaseHelper();
    await dbHelper.insertRegistration(registration);

    return true;
  }





}