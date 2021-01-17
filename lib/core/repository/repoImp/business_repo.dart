import 'package:agarrate/core/models/business.dart';
import 'package:agarrate/core/repository/repo/business_repo.dart';

class BusinessRepoImp extends BusinessRepo {
  @override
  Future<Business> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<List<Business>> getByLocation(double latitude, double longitude) {
    // TODO: implement getByLocation
    throw UnimplementedError();
  }

  @override
  Future<List<Business>> search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
