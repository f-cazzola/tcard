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

  Future<void> forward(
      {SwipeDirection? direction, Function? onFinishAnimation}) async {
    if (direction == null) {
      direction =
          Random().nextBool() ? SwipeDirection.Left : SwipeDirection.Right;
    }

    state!.swipeInfoList.add(SwipeInfo(state!.frontCardIndex, direction));
    await state!.runChangeOrderAnimation();
  }

  Future<void> back() async {
    await state!.runReverseOrderAnimation();
  }

  void reset({List<Widget>? cards}) => state!.reset(cards: cards);

  void append({required List<Widget> cards}) => state!.append(cards);

  void changeCards({required List<Widget> cards}) =>
      state!.changeCards(cards: cards);

  void dispose() {
    state = null;
  }
}
