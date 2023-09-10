part of 'number_bloc.dart';

@immutable
abstract class NumberEvent extends Equatable {}
class GetNumber extends NumberEvent {
  GetNumber({required this.id});
  final int id;
  @override
  List<Object?> get props => [];
}