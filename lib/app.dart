import 'package:mypsy_app/provider/api_provider.dart';
import 'package:mypsy_app/screens/calendar/calednar_info.dart';
import 'package:mypsy_app/screens/home/doctor_info.dart';
import 'package:mypsy_app/screens/menu/sub_pages/contact.dart';
import 'package:mypsy_app/screens/splash/splash.dart';
import 'package:mypsy_app/shared/routes.dart';
import 'package:mypsy_app/shared/themes/app_colors.dart';
import 'package:mypsy_app/shared/ui/error/error_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  bool? showError;
  FlutterErrorDetails? errorDetails;

  MyApp({
    super.key,
    this.showError = false,
    this.errorDetails,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ApiProvider()),
          //  ChangeNotifierProvider(create: (_) => ProfileProvider()),
          //ChangeNotifierProvider(create: (_) => HomeProvider()),
        ],
        child: MaterialApp(
          locale: const Locale('fr'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('fr')],
          title: 'mypsy',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.mypsyPrimary),
            useMaterial3: true,
          ),
          home: widget.showError!
              ? Scaffold(
                  body: ErrorScreen(
                    errorMessage:
                        widget.errorDetails?.exceptionAsString() ?? 'Erreur',
                  ),
                )
              : const SplashScreen(),
          routes: {
            Routes.contact: (context) => ContactPage(),
            Routes.doctorInfo: (context) => DoctorDetailScreen(),
            Routes.booking: (context) => BookingPage(),
          },
        ),
      );
}
