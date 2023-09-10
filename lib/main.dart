import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotels/bloc/booking_bloc/booking_bloc.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotels/bloc/number_bloc/number_bloc.dart';
import 'package:hotels/data/network/apiservice.dart';
import 'package:hotels/data/repository/hotel_repository.dart';
import 'package:hotels/data/repository/storage_repositroy/storage_repository.dart';
import 'utils/routs/approuts.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(App(
    apiService: ApiService(),
  ));
}

class App extends StatelessWidget {
  const App({super.key, required this.apiService});

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider(
              create: (context) => HotelRepository(apiService: apiService)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => UserBloc(
                    userRepository:
                        HotelRepository(apiService: ApiService()))),
            BlocProvider(
                create: (context) => NumberBloc(
                    userRepository:
                    HotelRepository(apiService: ApiService()))),
            BlocProvider(
                create: (context) => BookingBloc(
                    hotelRepository: HotelRepository(apiService: ApiService()))),
          ],
          child: MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: RouteNames.hotelScreen,
      ),
    );
  }
}
