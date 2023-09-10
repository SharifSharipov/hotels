part of 'number_bloc.dart';

@immutable
class NumberState extends Equatable {
  final FormStatus status;
  final List<Rooms> rooms;
  final String statusText;
  NumberState(
      {required this.status, required this.rooms, required this.statusText});
  NumberState copyWith({FormStatus? status, List<Rooms>? rooms, String? statusText}) {
    return NumberState(
        status: status ?? this.status,
        rooms: rooms ?? this.rooms,
        statusText: statusText ?? this.statusText);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, rooms, statusText];
}
