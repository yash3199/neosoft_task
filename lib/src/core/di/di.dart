import 'package:get/get.dart';
import 'package:neosoft_task/data/dataSource/address/address_remote_datasource.dart';
import 'package:neosoft_task/data/dataSource/address/address_remote_datasource_impl.dart';
import 'package:neosoft_task/data/repositories/address/address_repository_impl.dart';
import 'package:neosoft_task/domain/repository/address/address_repository.dart';
import 'package:neosoft_task/domain/usecases/address/address_usecases.dart';
import 'package:neosoft_task/presentation/controllers/addressInfo/address_info_controller.dart';

import '../../../presentation/controllers/basicInfo/basic_info_controller.dart';
import '../../../presentation/controllers/completeInfo/complete_info_controller.dart';

void init() {

  Get.lazyPut<AddressRemoteDataSource>(()=>AddressRemoteDataSourceImpl());

  Get.lazyPut<AddressRepository>(()=>AddressRepositoryImpl(Get.find<AddressRemoteDataSource>()));

  Get.lazyPut<AddressUseCases>(()=> AddressUseCases(Get.find<AddressRepository>()));

  Get.lazyPut<AddressController>(()=> AddressController(Get.find<AddressUseCases>()));

  Get.lazyPut<RegistrationController>(()=>RegistrationController());

  Get.lazyPut<EducationController>(()=>EducationController());

}