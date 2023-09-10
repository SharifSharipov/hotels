import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_event.dart';
import 'package:hotels/bloc/hotel_bloc/hotel_state.dart';
import 'package:hotels/data/models/hotel_model/about_hotel.dart';
import 'package:hotels/data/models/hotel_model/hotel_model.dart';
import 'package:hotels/data/models/status/formstatus.dart';
import 'package:hotels/data/repository/hotel_repository.dart';
import 'package:hotels/data/unversaldata/unversaldata.dart';

class UserBloc extends Bloc<UsersEvent, UserState> {
  HotelRepository userRepository;

  UserBloc({required this.userRepository})
      : super(UserState(
          status: FormStatus.pure,
          statusText: "",
          user: HotelModel(
            id: 0,
            name: "",
            address: "",
            minimalPrice: 0,
            priceForIt: "",
            rating: 0,
            ratingName: "",
            imageUrls: [],
            aboutTheHotel: AboutTheHotel(description: '', peculiarities: []),
          ),
        )) {
    on<GetUser>(_getUser);
  }

  _getUser(GetUser event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Getting User...",
      ),
    );
    UniversalData universalData = await userRepository.getUser();

    if (universalData.error.isEmpty) {
      print((universalData.data as HotelModel).imageUrls[0]);
      emit(
        state.copyWith(
            status: FormStatus.success,
            statusText: "Users fetched !!!",
            user: universalData.data as HotelModel),
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
