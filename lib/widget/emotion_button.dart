import 'package:ego/models/emotion.dart';
import 'package:flutter/material.dart';

class EmotionButton extends StatelessWidget {
  const EmotionButton({
    super.key,
    required this.emotion,
    required this.icon,
    this.onPressed,
  });

  final EmotionType emotion;
  final IconData icon;
  final void Function()? onPressed;

  Color getColorForEmotion(EmotionType emotion) {
    switch (emotion) {
      case EmotionType.ecstatic:
        return Colors.green;
      case EmotionType.happy:
        return Colors.lime;
      case EmotionType.neutral:
        return Colors.yellow;
      case EmotionType.unhappy:
        return Colors.orange;
      case EmotionType.miserable:
        return Colors.red;
      default:
        return Colors.grey; // Default color if no match found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 60,
        maxHeight: 70,
      ),
      decoration: BoxDecoration(
        color: getColorForEmotion(emotion),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
          Text(
            emotionDescriptions[emotion]!,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
