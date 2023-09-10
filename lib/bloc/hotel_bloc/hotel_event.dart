import 'package:equatable/equatable.dart';

abstract class UsersEvent extends Equatable {}

class GetUser extends UsersEvent {
  @override
  List<Object?> get props => [];
}