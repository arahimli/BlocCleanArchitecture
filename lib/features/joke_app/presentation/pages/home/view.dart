part of 'page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Random Joke", style: TextStyle(fontSize: 18),),
      ),
      body: BlocConsumer<RandomJokeBloc, RandomJokeState>(
        listener: (context, state) {
          log("listener");
        },
        builder: (context, state) {
          if(state is RandomJokeLoaded){
            return _LoadedJoke(joke: state.joke,);
          }else if(state is RandomJokeError){
            return _FailureJoke(failure: state.failure,);
          }else if(state is RandomJokeInitial){
            return const Center(
              child: Text('initializing'),
            );
          }else{
            return const _LoadingJoke();
          }
        },
      ),
    );
  }
}
