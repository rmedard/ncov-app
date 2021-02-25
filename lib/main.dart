import 'package:corona_2019_api/app/repositories/data_repository.dart';
import 'package:corona_2019_api/app/services/api.dart';
import 'package:corona_2019_api/app/services/api_service.dart';
import 'package:corona_2019_api/app/services/data_cache_service.dart';
import 'package:corona_2019_api/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Needed in order to instantiate SharedPreferences before runApp.
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key key, @required this.sharedPreferences}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DataRepository(
          apiService: APIService(API.sandbox()),
          dataCacheService:
              DataCacheService(sharedPreferences: sharedPreferences)),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xFF101010),
            cardColor: Color(0xFF222222)),
        home: Dashboard(),
      ),
    );
  }
}
