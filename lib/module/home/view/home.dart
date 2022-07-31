import 'package:bloc_learing/module/home/bloc/home_bloc.dart';
import 'package:bloc_learing/module/home/bloc/home_event.dart';
import 'package:bloc_learing/module/home/bloc/home_state.dart';
import 'package:bloc_learing/service/get_person_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            RepositoryProvider.of<GetPersonService>(context),
          ),
        )
      ],
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            return ListView.builder(
              itemCount: state.personList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.personList[index].name),
                );
              },
            );
          } else {
            return const Text('State not found');
          }
        }),
        floatingActionButton: Builder(builder: (context) {
          return Row(
            children: [
              ElevatedButton(
                child: const Text('fetch1'),
                onPressed: () {
                  context.read<HomeBloc>().add(
                        const LoadApiEvent(
                            url: 'http://127.0.0.1:5500/API/person1.json'),
                      );
                },
              ),
              ElevatedButton(
                child: const Text('fetch2'),
                onPressed: () {
                  context.read<HomeBloc>().add(
                        const LoadApiEvent(
                            url: 'http://127.0.0.1:5500/API/person2.json'),
                      );
                },
              ),
              ElevatedButton(
                child: const Text('Initial'),
                onPressed: () {
                  context.read<HomeBloc>().add(
                        const HomeInitialEvent(),
                      );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
