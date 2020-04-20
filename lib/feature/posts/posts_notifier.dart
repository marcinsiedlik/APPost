import 'package:appost/base/network/data_source/mapper/posts/post_response_ui_mapper.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostsNotifier extends BaseNotifier {
  final PostsRepository _repository;
  final PostResponseUiMapper _uiMapper;

  PostsNotifier(this._repository, this._uiMapper);

  final list = List.generate(20, (index) => 1);
}
