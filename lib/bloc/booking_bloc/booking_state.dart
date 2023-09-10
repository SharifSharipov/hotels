part of 'booking_bloc.dart';

@immutable
class BookingState extends Equatable {
  final FormStatus status;
  final String statusText;
  final BookingModel bookingModel;
  BookingState(
      {required this.status,
      required this.statusText,
      required this.bookingModel});
  BookingState copyWith(
      {FormStatus? status, BookingModel? bookingModel, String? statusText}) {
    return BookingState(
        status: status ?? this.status,
        bookingModel: bookingModel ?? this.bookingModel,
        statusText: statusText ?? this.statusText);
  }

  @override
  List<Object?> get props => [status, statusText, bookingModel];
}
