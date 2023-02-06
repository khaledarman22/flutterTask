part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class LodingDetailsState extends DetailsState {}

class DetailsStateErorr extends DetailsState {
  const DetailsStateErorr(
    this.errorMassage,
  );
  final String errorMassage;
}

class ListViewDetailsItemsState extends DetailsState {}

class GetAllDetailsState extends DetailsState {
  // const DetailsStateLoded({
  //   this.Prodacts,
  // });
  // final DetailsModel? Prodacts;
}
