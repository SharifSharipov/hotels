import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hotels/data/models/booking_model/booking_model.dart';
import 'package:hotels/data/models/status/formstatus.dart';
import 'package:hotels/data/repository/hotel_repository.dart';
import 'package:hotels/data/unversaldata/unversaldata.dart';
import 'package:meta/meta.dart';
part 'booking_event.dart';
part 'booking_state.dart';

//BookingState
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  HotelRepository hotelRepository;
  BookingBloc({required this.hotelRepository})
      : super(BookingState(
            status: FormStatus.pure,
            statusText: '',
            bookingModel: BookingModel(
                id: 0,
                hotelName: '',
                hotelAdress: '',
                horating: 0,
                ratingName: '',
                departure: '',
                arrivalCountry: '',
                tourDateStart: '',
                tourDateStop: '',
                numberOfNights: 0,
                room: '',
                nutrition: '',
                tourPrice: 0,
                fuelCharge: 0,
                serviceCharge: 0))) {
    on<GetMybooking>(_getBooking);
  }
  _getBooking(GetMybooking event, Emitter<BookingState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Getting User...",
      ),
    );
    UniversalData universalData = await hotelRepository.getBooking();
    if (universalData.error.isEmpty) {
      emit(
        state.copyWith(
            status: FormStatus.success,
            statusText: "Users fetched !!!",
            bookingModel: universalData.data as BookingModel),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.error,
          statusText: universalData.error,
        ),
      );
    }
  }
}
