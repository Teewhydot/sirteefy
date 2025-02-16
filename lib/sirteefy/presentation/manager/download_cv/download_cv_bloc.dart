import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/download_cv_usecase.dart';

import '../../../data/remote/data_sources/download_cv_datasource.dart';

part 'download_cv_event.dart';
part 'download_cv_state.dart';

class DownloadCvBloc extends Bloc<DownloadCvEvent, DownloadCvState> {
  DownloadCvBloc() : super(DownloadCvInitial()) {
    on<DownloadCv>((event, emit) async{
      // Simulate performing a download operation
      for (int i = 0; i <= 100; i++) {
        await Future.delayed(const Duration(milliseconds: 100));
        emit(DownloadCvInProgress(percentage: i.toDouble()));
      }
      emit(DownloadCvSuccess());
    });
  }
}
