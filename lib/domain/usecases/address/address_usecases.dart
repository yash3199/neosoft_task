

import 'package:flutter/cupertino.dart';

import '../../repository/address/address_repository.dart';

class AddressUseCases {
  final AddressRepository _addressRepository;
  const AddressUseCases(this._addressRepository);
  Future<bool?> saveRegistrationData() async {
    try{
      bool? saved=await _addressRepository.saveRegistrationData();
      return saved;
    }catch(e){
      debugPrint("Error caught in use case $e");
    }
  }
}