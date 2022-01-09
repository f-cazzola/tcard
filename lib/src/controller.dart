import 'dart:math';
import 'package:flutter/material.dart';

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

  void reset({List<Widget>? cards}) => state!.reset(cards: cards);

  void append({required List<Widget> cards}) => state!.append(cards);

  void changeCards({required List<Widget> cards}) =>
      state!.changeCards(cards: cards);

  void dispose() {
    state = null;
  }
}
