import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/home_feature/data/models/home_prodacts/home_prodacts.dart';
import 'package:fluttertask/features/home_feature/data/repo_impel/home_repo_impel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepoImpel}) : super(HomeInitial());
  HomeRepoImpel homeRepoImpel;

  Future<void> feachHomeData() async {
    emit(HomeStateLoding());
    homeRepoImpel.fetchBeseProdact(categoryid: '2').then((resalt) {
      resalt.fold((fealure) {
        emit(HomeStateErorr(fealure.errMassage));
        // ignore: non_constant_identifier_names
      }, (Prodacts) {
        emit(HomeStateLoded(Prodacts));
      });
    });
  }
}
