import 'package:subero_mobile/data/provider/sample_provider.dart';

class SampleRepository {
  final SampleProvider sampleProvider;

  SampleRepository({required this.sampleProvider});

  getData(String id) {
    return sampleProvider.getData(id);
  }
}
