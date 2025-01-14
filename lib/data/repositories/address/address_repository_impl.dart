
import 'package:neosoft_task/domain/repository/address/address_repository.dart';

import '../../dataSource/address/address_remote_datasource.dart';

class AddressRepositoryImpl implements AddressRepository{
  final AddressRemoteDataSource _addressRemoteDataSource;
  AddressRepositoryImpl(this._addressRemoteDataSource);

  @override
  Future<bool?> saveRegistrationData() async {
    try{
      return await _addressRemoteDataSource.saveRegistrationData();
    }catch(e){
      throw Exception(e.toString());
    }
  }
}