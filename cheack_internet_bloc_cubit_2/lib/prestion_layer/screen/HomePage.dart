// import 'package:cheack_internet_bloc_cubit_2/Business_logic_layer/interNet_check/internet_check_bloc.dart';
import 'package:cheack_internet_bloc_cubit_2/Business_logic_layer/internetCubit/inter_net_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<InterNetCubitCubit>().checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    String internet = '';
    return Scaffold(
      //~~~~~~~~~~~~~~~~ with Bloc
      // body: Container(
      //   child: BlocBuilder<InternetCheckBloc, InternetCheckState>(
      //     builder: (context, state) {
      //       if (state is ConnectedState) {
      //         internet = state.isConnected;
      //         return Center(
      //           child: Text(internet),
      //         );
      //       } else if (state is NotConnectedState) {
      //         internet = state.isConnected;
      //         return Center(
      //           child: Text(internet),
      //         );
      //       }
      //       return Center(
      //         child: Text(internet),
      //       );
      //     },
      //   ),
      // ),
      body: Container(
        child: BlocBuilder<InterNetCubitCubit, InterNetCubitState>(
          builder: (context, state) {
            if (state is ConnectedStateCubit) {
              internet = state.internetState;
              return Center(
                child: Text(internet),
              );
            } else if (state is NotConnectedStateCubit) {
              internet = state.internetState;
              return Center(
                child: Text(internet),
              );
            }
            return Center(
              child: Text(internet),
            );
          },
        ),
      ),
    );
  }
}
