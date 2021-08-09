// あなたは、エンティティを分ける責任があり、基本的には、エンティティは、あなたのまたはあなたのプロバイダと対話するデータベースのすべての「テーブル」です。
// リポジトリは、データ ソースをコントローラから抽象化して分離することを目的としているため、単一点の障害が発生しますが、ある日、プロジェクトの API やデータベースを変更する場合は、ファイルプロバイダを変更するだけで、リポジトリに変更を行う必要はありません。
// exあなたは、唯一の確立の顧客と製品を持っている製品販売アプリを持っていることを想像してみてください。
// 私たちは簡単に私たちに質問をすることによって、私たちのエンティティを識別することができます。
// このエンティティからデータを受信または送信しますか?答えが「はい」の場合、リポジトリが必要です。
// この例では、ユーザーリポジトリ、製品リポジトリ、設立リポジトリという3つのリポジトリがあります。
// クラスに基づいてこれらのエンティティを受け取ることができる場合もありますが、データベースや API に必ずしも含まれているわけではないヘルパー クラスが存在する場合が多いため、実際にデータベースと対話するものに依存する方が好まれます。
// そうすれば、私たちはコントローラから多くの責任を負い、データがどこから来たのかを知る必要はありません> <。
// このように、より良い組織を持つコードの理解を残し、直感的に、維持することは非常に簡単です。
// この例では、リポジトリは api とコントローラの間のフィールド メディアを担当し、コントローラ内の API 呼び出しを担当します。次に、リポジトリディレクトリとposts_repository.dartファイル

import 'package:subero_mobile/app/data/provider/api.dart';

//Repositório responsável pela entidade post !!
//lembrando que cada entidade que persiste de alguma forma com o banco de dados, seja ela uma api ou sqlite
//deve possuir um repositório excluisivo
class MyRepository {
  final MyApiClient apiClient;

  MyRepository({required this.apiClient});

  getAll() {
    apiClient.getAll();
  }
}
