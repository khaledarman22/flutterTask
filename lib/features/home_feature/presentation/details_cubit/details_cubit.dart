import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/home_feature/data/models/details_model/details_model.dart';
import 'package:fluttertask/features/home_feature/data/models/details_model/more_image.dart';
import 'package:fluttertask/features/home_feature/data/repo_impel/details_repo_impel.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit({
    required this.detailsRepoImpel,
  }) : super(DetailsInitial());
  final DetailsRepoImpel detailsRepoImpel;
  static DetailsCubit get(context) => BlocProvider.of(context);
  DetailsModel? detailsModel;
  String? image;
  String? color;
  List<Size>? size;
  List<MoreImage>? moreImages;
  int? selectSize;
  int? selectColor;

  Future<void> fetchDetailsProdact(
      {required String productId, required BuildContext context}) async {
    detailsRepoImpel.fetchDetailsProdact(productId: productId).then((result) {
      result.fold((failure) {
        emit(DetailsStateErorr(failure.errMassage));
        Navigator.pop(context);
      }, (detailsModel) {
        this.detailsModel = detailsModel;
        moreImages = detailsModel.data!.moreImage;

        emit(GetAllDetailsState());
      });
    });
  }

  void getImage({
    required int id,
  }) async {
    emit(LodingDetailsState());
    image = moreImages![id].image;
    emit(ListViewDetailsItemsState());
  }

  Future<void> getSize({
    required int index,
  }) async {
    emit(LodingDetailsState());
    selectSize = index;
    emit(ListViewDetailsItemsState());
  }

  void getColor({
    required int index,
  }) async {
    emit(LodingDetailsState());
    selectColor = index;
    emit(ListViewDetailsItemsState());
  }
}
