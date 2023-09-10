

import 'package:flutter/material.dart';
import 'package:hotels/ui/booking/booking_screen.dart';
import 'package:hotels/ui/hotel/hotel_screen.dart';
import 'package:hotels/ui/number_screen/number_screen.dart';
import 'package:hotels/ui/order_has_been_screen/order_has_been_paid_screen.dart';

class RouteNames {
  static const String hotelScreen = "/";
  static const String bookingScreen = "/booking";
  static const String numberScreen = "/numberScreen";
  static const String orderhaseBeenScreen='/orderrHasBeenScreen';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.hotelScreen:
        return MaterialPageRoute(builder: (context) => HotelScreen());
      case RouteNames.bookingScreen:
        return MaterialPageRoute(builder: (context) {
          return BookingScreen();
        });
      case RouteNames.numberScreen:
        return MaterialPageRoute(builder: (context) {
          return NumberScreen();
        });
      case RouteNames.orderhaseBeenScreen:
        return MaterialPageRoute(builder: (context) {
          return OrderHasBeenPaidScreen();
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Маршрут недоступен"),
            ),
          ),
        );
    }
  }
}
