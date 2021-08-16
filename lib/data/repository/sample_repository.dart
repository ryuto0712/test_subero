import 'package:subero_mobile/data/provider/sample_provider.dart';

class SampleRepository {
  final SampleProvider sampleProvider;

  SampleRepository({required this.sampleProvider});

  getData(String id) {
    print('getData method in SampleRepository is running. The id is $id');
    return sampleProvider.getData(id);
  }
}
