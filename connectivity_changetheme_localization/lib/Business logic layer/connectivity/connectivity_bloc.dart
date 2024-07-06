import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  StreamSubscription? subscription;
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(IntertetConnected(internetMessage: 'internet Connected'));
      } else if (event is NotConnectedEvent) {
        emit(IntertetConnected(internetMessage: 'internet Not Connected'));
      }
    });
    subscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi ||
          connectivityResult == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
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
