
import 'package:hotels/data/network/apiservice.dart';

import '../unversaldata/unversaldata.dart';

class HotelRepository {
  final ApiService apiService;

  HotelRepository({required this.apiService});

  Future<UniversalData> getUser() async {
    return apiService.getUserModel();
  }

  Future<UniversalData> getHotelById(int Id) async =>
      apiService.getWebsiteById(Id);
  Future<UniversalData> getBooking() async {
    return apiService.getBooking();
  }
}
