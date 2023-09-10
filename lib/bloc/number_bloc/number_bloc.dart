import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotels/data/models/number_model/rooms_model.dart';
import 'package:hotels/data/models/status/formstatus.dart';
import 'package:hotels/data/repository/hotel_repository.dart';
import 'package:hotels/data/unversaldata/unversaldata.dart';
import 'package:meta/meta.dart';


part 'number_event.dart';
part 'number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  HotelRepository userRepository;
  NumberBloc({required this.userRepository})
      : super(NumberState(status: FormStatus.pure, rooms: [], statusText: '')) {
    on<GetNumber>(_getHotelById);
  }
  _getHotelById(GetNumber event, Emitter<NumberState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: ""));
    UniversalData universaldata = await userRepository.getHotelById(event.id);
    if (universaldata.error.isEmpty) {
      emit(state.copyWith(
          status: FormStatus.success,
          statusText: "get_hotel_by_id",
          rooms: universaldata.data as List<Rooms>));
    } else {
      emit(state.copyWith(
        status: FormStatus.error,
        statusText: universaldata.error,
      ));
    }
  }
}
