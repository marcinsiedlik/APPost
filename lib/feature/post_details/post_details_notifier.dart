import 'package:appost/base/extensions/router_extensions.dart';
import 'package:appost/base/network/data_source/mapper/posts/post_details_ui_mapper.dart';
import 'package:appost/base/network/data_source/model/posts/ui/ui_post_details.dart';
import 'package:appost/base/network/data_source/repository/posts/posts_repository.dart';
import 'package:appost/base/ui/call_state/call_state.dart';
import 'package:appost/base/ui/notifier/base_notifier.dart';
import 'package:appost/base/ui/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostDetailsNotifier extends BaseNotifier {
  final PostsRepository _repository;
  final PostDetailsUiMapper _uiMapper;
  final int _postId;

  PostDetailsNotifier(
    this._repository,
    this._uiMapper,
    @factoryParam this._postId,
  ) {
    _fetchPostDetails();
  }

  var postDetailsState = CallState<UiPostDetails>();

  void _fetchPostDetails() async {
    dispatch(
      callState: postDetailsState,
      block: () async {
        final details = await _repository.getPostDetails(postId: _postId);
        return _uiMapper.mapToUi(details);
      },
      onError: RouterExtensions.showErrorFlushbar,
    );
  }

  void onVisitProfileClicked() {
    if (postDetailsState.isSuccessful) {
      ExtendedNavigator.ofRouter<Router>().pushUserProfileScreen(userId: postDetailsState.data.userId);
    }
  }
}
