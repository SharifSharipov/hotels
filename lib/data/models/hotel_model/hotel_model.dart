

import 'package:hotels/data/models/hotel_model/about_hotel.dart';
import 'package:hotels/data/models/hotel_model/hotel_model_filds.dart';

class HotelModel {
  final int id;
  final String name;
  final String address;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List<dynamic> imageUrls;
  AboutTheHotel aboutTheHotel;

  HotelModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.minimalPrice,
      required this.priceForIt,
      required this.rating,
      required this.ratingName,
      required this.imageUrls,
      required this.aboutTheHotel});

  HotelModel copyWith({
    int? id,
    String? name,
    String? address,
    int? minimalPrice,
    String? priceForIt,
    int? rating,
    String? ratingName,
    List<dynamic>? imageUrls,
    AboutTheHotel? aboutTheHotel,
  }) {
    return HotelModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        minimalPrice: minimalPrice ?? this.minimalPrice,
        priceForIt: priceForIt ?? this.priceForIt,
        rating: rating ?? this.rating,
        ratingName: ratingName ?? this.ratingName,
        imageUrls: imageUrls ?? this.imageUrls,
        aboutTheHotel: aboutTheHotel ?? this.aboutTheHotel);
  }

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
        id: json[HotelModelFilds.id] as int? ?? 0,
        name: json[HotelModelFilds.name] as String? ?? "",
        address: json[HotelModelFilds.address] as String? ?? "",
        minimalPrice: json[HotelModelFilds.minimalPrice] as int? ?? 0,
        priceForIt: json[HotelModelFilds.priceForIt] as String? ?? "",
        rating: json[HotelModelFilds.rating] as int? ?? 0,
        ratingName: json[HotelModelFilds.ratingName] as String? ?? "",
        imageUrls: json[HotelModelFilds.imageUrls] as List<dynamic>? ?? [],
        aboutTheHotel: AboutTheHotel.fromJson(json[HotelModelFilds.aboutTheHotel]),);
  }

  Map<String, dynamic> toJson() {
    return {
      HotelModelFilds.id: id,
      HotelModelFilds.name: name,
      HotelModelFilds.address: address,
      HotelModelFilds.minimalPrice: minimalPrice,
      HotelModelFilds.priceForIt: priceForIt,
      HotelModelFilds.rating: rating,
      HotelModelFilds.ratingName: ratingName,
      HotelModelFilds.imageUrls: imageUrls,
      HotelModelFilds.aboutTheHotel: aboutTheHotel.toJson(),
    };
  }

  @override
  String toString() {
    return """
         ${HotelModelFilds.id}:$id,
         ${HotelModelFilds.name}:$name,
         ${HotelModelFilds.address}:$address,
         ${HotelModelFilds.minimalPrice}:$minimalPrice,
         ${HotelModelFilds.priceForIt}:$priceForIt,
         ${HotelModelFilds.rating}:$rating,
         ${HotelModelFilds.imageUrls}:$imageUrls,
         ${HotelModelFilds.aboutTheHotel}:$aboutTheHotel,         
     """;
  }
}
