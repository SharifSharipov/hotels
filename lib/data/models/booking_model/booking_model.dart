
import 'package:hotels/data/models/booking_model/booking_model_filds.dart';

class BookingModel {
  int id;
  String hotelName;
  String hotelAdress;
  int horating;
  String ratingName;
  String departure;
  String arrivalCountry;
  String tourDateStart;
  String tourDateStop;
  int numberOfNights;
  String room;
  String nutrition;
  int tourPrice;
  int fuelCharge;
  int serviceCharge;

  BookingModel({
    required this.id,
    required this.hotelName,
    required this.hotelAdress,
    required this.horating,
    required this.ratingName,
    required this.departure,
    required this.arrivalCountry,
    required this.tourDateStart,
    required this.tourDateStop,
    required this.numberOfNights,
    required this.room,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
  BookingModel copyWith({
    int? id,
    String? hotelName,
    String? hotelAdress,
    int? horating,
    String? ratingName,
    String? departure,
    String? arrivalCountry,
    String? tourDateStart,
    String? tourDateStop,
    int? numberOfNights,
    String? room,
    String? nutrition,
    int? tourPrice,
    int? fuelCharge,
    int? serviceCharge,
  }) {
    return BookingModel(
        id: id ?? this.id,
        hotelName: hotelName ?? this.hotelName,
        hotelAdress: hotelAdress ?? this.hotelAdress,
        horating: horating ?? this.horating,
        ratingName: ratingName ?? this.ratingName,
        departure: departure ?? this.departure,
        arrivalCountry: arrivalCountry ?? this.arrivalCountry,
        tourDateStart: tourDateStart ?? this.tourDateStart,
        tourDateStop: tourDateStop ?? this.tourDateStop,
        numberOfNights: numberOfNights ?? this.numberOfNights,
        room: room ?? this.room,
        nutrition: nutrition ?? this.nutrition,
        tourPrice: tourPrice ?? this.tourPrice,
        fuelCharge: fuelCharge ?? this.fuelCharge,
        serviceCharge: serviceCharge ?? this.serviceCharge);
  }
  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json[BookingModelFilds.id],
        hotelName: json[BookingModelFilds.hotelName],
        hotelAdress: json[BookingModelFilds.hotelAdress],
        horating: json[BookingModelFilds.horating],
        ratingName: json[BookingModelFilds.ratingName],
        departure: json[BookingModelFilds.departure],
        arrivalCountry: json[BookingModelFilds.arrivalCountry],
        tourDateStart: json[BookingModelFilds.tourDateStart],
        tourDateStop: json[BookingModelFilds.tourDateStop],
        numberOfNights: json[BookingModelFilds.numberOfNights],
        room: json[BookingModelFilds.room],
        nutrition: json[BookingModelFilds.nutrition],
        tourPrice: json[BookingModelFilds.tourPrice],
        fuelCharge: json[BookingModelFilds.fuelCharge],
        serviceCharge: json[BookingModelFilds.serviceCharge],
      );

  Map<String, dynamic> toJson() => {
        BookingModelFilds.id: id,
        BookingModelFilds.hotelName: hotelName,
        BookingModelFilds.hotelAdress: hotelAdress,
        BookingModelFilds.horating: horating,
        BookingModelFilds.ratingName: ratingName,
        BookingModelFilds.departure: departure,
        BookingModelFilds.arrivalCountry: arrivalCountry,
        BookingModelFilds.tourDateStart: tourDateStart,
        BookingModelFilds.tourDateStop: tourDateStop,
        BookingModelFilds.numberOfNights: numberOfNights,
        BookingModelFilds.room: room,
        BookingModelFilds.nutrition: nutrition,
        BookingModelFilds.tourPrice: tourPrice,
        BookingModelFilds.fuelCharge: fuelCharge,
        BookingModelFilds.serviceCharge: serviceCharge,
      };
}
