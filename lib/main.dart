import 'package:corona_2019_api/app/repositories/data_repository.dart';
import 'package:corona_2019_api/app/services/api.dart';
import 'package:corona_2019_api/app/services/api_service.dart';
import 'package:corona_2019_api/app/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DataRepository(apiService: APIService(API.sandbox())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF101010),
          cardColor: Color(0xFF222222)
        ),
        home: Dashboard(),
      ),
    );
  }
}
