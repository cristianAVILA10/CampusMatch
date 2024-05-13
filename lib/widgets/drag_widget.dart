import 'package:campusmatch/Models/User.dart';
import 'package:campusmatch/main.dart';

import 'package:campusmatch/widgets/profile_card.dart';
import 'package:campusmatch/widgets/tag_widget.dart';
import 'package:flutter/material.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.user,
    required this.index,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);

  final User user;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: widget.swipeNotifier.value != Swipe.none
                    ? widget.swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    UserCard(user: widget.user),
                    widget.swipeNotifier.value != Swipe.none
                        ? widget.swipeNotifier.value == Swipe.right
                            ? Positioned(
                                top: 40,
                                left: 20,
                                child: Transform.rotate(
                                  angle: 12,
                                  child: TagWidget(
                                    text: 'LIKE',
                                    color: Colors.green[400]!,
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 50,
                                right: 24,
                                child: Transform.rotate(
                                  angle: -12,
                                  child: TagWidget(
                                    text: 'DISLIKE',
                                    color: Colors.red[400]!,
                                  ),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          widget.swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        // This will be visible when we press action button
        child: Stack(
          children: [
            UserCard(user: widget.user),
            // Check if this is the last card and Swipe is not equal to Swipe.none
            widget.swipeNotifier.value != Swipe.none && widget.isLastCard
                ? widget.swipeNotifier.value == Swipe.right
                    ? Positioned(
                        top: 40,
                        left: 20,
                        child: Transform.rotate(
                          angle: 12,
                          child: TagWidget(
                            text: 'LIKE',
                            color: Colors.green[400]!,
                          ),
                        ),
                      )
                    : Positioned(
                        top: 50,
                        right: 24,
                        child: Transform.rotate(
                          angle: -12,
                          child: TagWidget(
                            text: 'DISLIKE',
                            color: Colors.red[400]!,
                          ),
                        ),
                      )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
