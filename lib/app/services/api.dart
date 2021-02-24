import 'package:corona_2019_api/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint { cases, casesSuspected, casesConfirmed, deaths, recovered }

class API {
  final String apiKey;

  API({@required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxKey);

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() => Uri.https(host, '/token');

  Uri endPointUri(Endpoint endpoint) => Uri.https(host, _paths[endpoint]);

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: '/cases',
    Endpoint.casesSuspected: '/casesSuspected',
    Endpoint.casesConfirmed: '/casesConfirmed',
    Endpoint.deaths: '/deaths',
    Endpoint.recovered: '/recovered',
  };
}
