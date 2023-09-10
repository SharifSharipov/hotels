import 'rooms_model_filds.dart';

class Rooms {
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List<dynamic> peculiarities;
  final List<dynamic> imageUrls;

  Rooms({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });
  Rooms copyWith({
    int? id,
    String? name,
    int? price,
    String? pricePer,
    List<dynamic>? peculiarities,
    List<dynamic>? imageUrls,
  }) {
    return Rooms(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        pricePer: pricePer ?? this.pricePer,
        peculiarities: peculiarities ?? this.peculiarities,
        imageUrls: imageUrls ?? this.imageUrls);
  }

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        id: json[RoomsModelFilds.id] as int? ?? 0,
        name: json[RoomsModelFilds.name] as String? ?? "",
        price: json[RoomsModelFilds.price] as int? ?? 0,
        pricePer: json[RoomsModelFilds.pricePer] as String? ?? "",
        peculiarities: List<String>.from(
            json[RoomsModelFilds.peculiarities].map((x) => x)),
        imageUrls:
            List<String>.from(json[RoomsModelFilds.imageUrls].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        RoomsModelFilds.id: id,
        RoomsModelFilds.name: name,
        RoomsModelFilds.price: price,
        RoomsModelFilds.pricePer: pricePer,
        RoomsModelFilds.peculiarities:
            List<dynamic>.from(peculiarities.map((x) => x)),
        RoomsModelFilds.imageUrls: List<dynamic>.from(imageUrls.map((x) => x)),
      };
}
