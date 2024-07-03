import 'package:quran_app/core/constant/app_api_routes.dart';
import 'package:quran_app/main/data/model/pair_model.dart';
import 'package:quran_app/services/api_services.dart';

abstract class QuranRemoteDataSource {
  // TODO This is example
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId});
}

class QuranRemoteDataSourceImpl extends QuranRemoteDataSource {
  final ApiService apiService;

  QuranRemoteDataSourceImpl({required this.apiService});

  // TODO This is example
  @override
  Future<List<PairModel>> getCategoriesAsPair(
      {required int repositoryId}) async {
    try {
      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppApiRoutes.getCategoriesAsPair,
        parameters: {
          'repository_id': repositoryId.toString(),
        },
      );
      final List<PairModel> expenses = mapData['data']
          .map<PairModel>(
            (item) => PairModel.fromJson(item),
          )
          .toList();

      return Future.value(expenses);
    } catch (e) {
      rethrow;
    }
  }
}
