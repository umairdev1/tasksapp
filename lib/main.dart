import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/screens/splash_screen.dart';

import 'package:tasksapp/screens/tasks_screen.dart';
import 'package:tasksapp/services/app_routes.dart';
import 'package:tasksapp/services/app_theme.dart';
import 'package:tasksapp/utilities/colors.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => DarkModeBloc(),
        ),
      ],
      child: BlocBuilder<DarkModeBloc, DarkModeState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            // systemNavigationBarColor:
            //     state.switchValue ? Color.fromARGB(31, 28, 26, 26) : kbgColor,
            statusBarColor: state.switchValue ? kprimaryColor : kbgColor,
            statusBarBrightness:
                state.switchValue ? Brightness.light : Brightness.dark,
            statusBarIconBrightness:
                state.switchValue ? Brightness.light : Brightness.dark,
          ));
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            initialRoute: SplashScreen.id,
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
