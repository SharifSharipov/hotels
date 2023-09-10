

import 'package:hotels/data/models/hotel_model/hotel_model_filds.dart';

class AboutTheHotel {
  String description;
  List<String> peculiarities;

  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) => AboutTheHotel(
        description: json[HotelModelFilds.description],
        peculiarities: List<String>.from(
            json[HotelModelFilds.peculiarities].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        HotelModelFilds.description: description,
        HotelModelFilds.peculiarities:
            List<dynamic>.from(peculiarities.map((x) => x)),
      };
}
