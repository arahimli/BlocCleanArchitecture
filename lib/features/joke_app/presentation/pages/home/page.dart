import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection.dart';
import '../../../domain/entities/joke_entity.dart';
import '../../../domain/failures/failures.dart';
import '../../logic/random_joke/bloc.dart';
import '../../widgets/components/buttons/load_more_button.dart';
import '../../widgets/components/buttons/refresh_button.dart';
import '../../widgets/components/skeletons/skeleton.dart';

part 'view.dart';
part '../../widgets/pages/home/loaded_joke.dart';
part '../../widgets/pages/home/failure_joke.dart';
part '../../widgets/pages/home/loading_joke.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<RandomJokeBloc>()..add(RandomJokeGetData()),
          )
        ],
        child: const HomeView());
  }
}
