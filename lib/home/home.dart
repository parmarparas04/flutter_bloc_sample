import 'package:bloc_sample/home/bloc/home_bloc.dart';
import 'package:bloc_sample/network/fakeapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Sample'),
      ),
      body: BlocProvider(
        create: (context) =>
            HomeBloc(RepositoryProvider.of<FakeApiService>(context))
              ..add(
                LoadHomeEvent(),
              ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is LoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100),
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<HomeBloc>(context).add(ApiCallEvent()),
                    child: const Text('Hit Me'),
                  ),
                ],
              );
            }
            if (state is LoadingState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 20),
                  Text(state.loadingStatus),
                  if (state.icon != null)
                    Icon(
                      state.icon,
                      size: 30,
                    )
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
