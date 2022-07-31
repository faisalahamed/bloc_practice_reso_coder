import 'package:bloc/bloc.dart';
import 'package:bloc_learing/module/home/bloc/home_event.dart';
import 'package:bloc_learing/module/home/bloc/home_state.dart';
import 'package:bloc_learing/service/get_person_service.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPersonService _getService;
  HomeBloc(this._getService) : super(HomeInitialState()) {
    on<LoadApiEvent>((event, emit) async {
      final userList = await _getService.getPerson(url: event.url);
      emit(HomeLoadedState(personList: userList));
    });
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeInitialState());
    });
  }
}
