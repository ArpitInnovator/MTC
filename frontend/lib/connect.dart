import 'package:dio/dio.dart';
import 'package:mtc/constants/server_constant.dart';

final dio = Dio() ;

class Connect{
  static Future<void> addCustomer({
    required String name,
    required String phone,
    required String address,
  }) async {
    final response = await dio.post('${ServerConstant.baseUrl}/add-customer', data: {
      'name': name,
      'phone': phone,
      'address': address,
    });
    print(response);
  }
}
