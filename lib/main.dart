
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workspacify_flutter_test/routes/app_routers.dart';
import 'package:workspacify_flutter_test/screens/home/main_screen.dart';
import 'package:workspacify_flutter_test/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    configureRoutes(router);
    return MultiProvider(
      providers: [
        Provider<FluroRouter>.value(value: router)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'SFPro',
        ),
        onGenerateRoute: router.generator,
        home: SplashScreen(),
      ),
    );
  }
  
  void configureRoutes(FluroRouter router){
    router.define(
        AppRouters.APP_MAIN_ROUTE,
        handler: Handler(handlerFunc: (_,__) => MainScreen())
    );
  }
}