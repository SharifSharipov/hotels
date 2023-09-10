part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}
class GetMybooking extends BookingEvent {
  GetMybooking({required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}