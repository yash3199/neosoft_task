import 'package:get/get.dart';
import '../../../presentation/view/adddressInfo/address_info.dart';
import '../../../presentation/view/basicInfo/basic_info_view.dart';
import '../../../presentation/view/completeInfo/complete_info.dart';



class Routes{
  static const basicInfoPage= '/basicInfoPage';
  static const completeInfoPage = '/completeInfoPage';
  static const addressInfoPage = '/addressInfoPage';
}

class AppPages {
  static var pages =[
    GetPage(name: Routes.basicInfoPage, page: ()=> BasicInfoPage()),
    GetPage(name: Routes.completeInfoPage, page: ()=> ProfessionalInfoPage()),
    GetPage(name: Routes.addressInfoPage, page: ()=> AddressInfo())
  ];
}