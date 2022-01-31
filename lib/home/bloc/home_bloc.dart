import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/network/fakeapi.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FakeApiService _fakeApiService;

  HomeBloc(this._fakeApiService) : super(InitState()) {
    on<LoadHomeEvent>(
      (event, emit) => emit(
        LoadedState(),
      ),
    );

    on<ApiCallEvent>((event, emit) async {
      emit(const LoadingState('Loading...'));
      final response = await _fakeApiService.loadFakeData();
      emit(LoadingState(response));
      await Future.delayed(const Duration(seconds: 2));
      emit(LoadedState());
    });
  }
}
