import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/blocs/navcount_bloc/navi_count_bloc.dart';
import 'package:tasksapp/screens/main_screen/main_screen.dart';
import 'package:tasksapp/screens/splash/splash_screen.dart';

import 'package:tasksapp/screens/todo_allscreens/tasks_screen.dart';
import 'package:tasksapp/services/app_routes.dart';
import 'package:tasksapp/services/app_theme.dart';
import 'package:tasksapp/utilities/colors.dart';

import 'blocs/bloc_exports.dart';
import 'blocs/notes_bloc/notes_data_bloc.dart';

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
        BlocProvider(
          create: (context) => NaviCountBloc(),
        ),
        BlocProvider(
          create: (context) => NotesDataBloc(),
        ),
      ],
      child: BlocBuilder<DarkModeBloc, DarkModeState>(
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: state.switchValue ? kprimaryColor : kwhiteColor,
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
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
