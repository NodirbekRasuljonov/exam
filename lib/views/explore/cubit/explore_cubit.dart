import 'package:bloc/bloc.dart';
import 'package:exam/views/explore/state/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit()
      : super(
          ExploreInitialState(),
        );
}
