import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'inter_net_cubit_state.dart';

class InterNetCubitCubit extends Cubit<InterNetCubitState> {
  InterNetCubitCubit() : super(InterNetCubitInitial());

  StreamSubscription? subscription;

  checkConnectivity() async {
    subscription = await Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        return emit(ConnectedStateCubit(internetState: 'connected'));
      } else {
        emit(NotConnectedStateCubit(internetState: 'not connected'));
      }
      print(event);
    });
  }
}
