import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_change_name_1/Business_logiclayer/name_bloc/name_state_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<NameStateBloc>().add(NameFullEvent());
            },
            child: Text('full name'),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<NameStateBloc>(context).add(NameClearEvent());
            },
            child: Text('clear name'),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<NameStateBloc>().add(NameResetEvent());
            },
            child: Text('reset name'),
          ),
        ],
      ),
      body: BlocBuilder<NameStateBloc, NameStateState>(
        builder: (context, state) {
          if (state is NameStateLoding) {
            return Center(
              child: Text(state.name!),
            );
          } else if (state is NameStateSucces) {
            return Center(
              child: Text(state.name!),
            );
          } else {
            return Center(
              child: Text(''),
            );
          }
        },
      ),
    );
  }
}
