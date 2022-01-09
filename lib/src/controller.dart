import 'dart:math';
import 'cards.dart';
import 'swipe_info.dart';

/// Card controller
class TCardController {
  TCardState? state;

  void bindState(TCardState state) {
    this.state = state;
  }

  int get index => state?.frontCardIndex ?? 0;

  forward({SwipeDirection? direction, Function? onFinishAnimation}) {
    if (direction == null) {
      direction =
          Random().nextBool() ? SwipeDirection.Left : SwipeDirection.Right;
    }

    state!.swipeInfoList.add(SwipeInfo(state!.frontCardIndex, direction));
    state!.runChangeOrderAnimation(onFinishAnimation: onFinishAnimation);
  }

  back({Function? onFinishAnimation}) {
    state!.runReverseOrderAnimation(onFinishAnimation);
  }

  get reset => state!.reset;

  get append => state!.append;

  get changeCards => state!.changeCards;

  void dispose() {
    state = null;
  }
}
