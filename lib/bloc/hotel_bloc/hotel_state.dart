
import 'package:equatable/equatable.dart';
import 'package:hotels/data/models/hotel_model/hotel_model.dart';
import 'package:hotels/data/models/status/formstatus.dart';
class UserState extends Equatable {
  const UserState({
    required this.status,
    required this.statusText,
    required this.user,
  });

  final FormStatus status;
  final HotelModel user;
  final String statusText;

  UserState copyWith({
    FormStatus? status,
    HotelModel? user,
    List<HotelModel>?hotel,
    String? statusText,
  }) =>
      UserState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        user: user ?? this.user,
      );

  @override
  List<Object?> get props => [
    status,
    user,
    statusText,
  ];
}