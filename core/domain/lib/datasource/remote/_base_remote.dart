import 'package:domain/client/rest_client.dart';

abstract class BaseRemote {
  RestClient get apiClient => RestClient.instance;
}
