// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_check_event.dart';
part 'internet_check_state.dart';

class InternetCheckBloc extends Bloc<InternetCheckEvent, InternetCheckState> {
  StreamSubscription? subscription;
  InternetCheckBloc() : super(InternetCheckInitial()) {
    on<InternetCheckEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(isConnected: 'Internet is connected'));
      } else if (event is notConnectedEvent) {
        emit(NotConnectedState(isConnected: 'Internet is not connected'));
      }
    });

    subscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(notConnectedEvent());
      }
    });
    print(subscription);
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
