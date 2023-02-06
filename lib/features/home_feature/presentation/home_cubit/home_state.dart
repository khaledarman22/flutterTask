// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoding extends HomeState {}

class HomeStateLoded extends HomeState {
  const HomeStateLoded(
    this.Prodacts,
  );
  // ignore: non_constant_identifier_names
  final HomeProdacts Prodacts;
}

class HomeStateErorr extends HomeState {
  const HomeStateErorr(
    this.errorMassage,
  );
  final String errorMassage;
}
