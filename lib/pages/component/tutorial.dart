import 'package:flutter/material.dart';

class CoachmarkDesc extends StatefulWidget {
  const CoachmarkDesc({
    super.key,
    required this.text,
    this.skip = "Skip",
    this.next = "Next",
    this.onSkip,
    this.onNext,
    this.isLast = false,
  });
  final String text;
  final String skip;
  final String next;
  final void Function()? onSkip;
  final void Function()? onNext;
  final bool isLast;
  @override
  State<CoachmarkDesc> createState() => _CoachmarkDescState();
  
}
class _CoachmarkDescState extends State <CoachmarkDesc> {
  @override
    Widget build (BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),// BoxDecoration
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start, 
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyMedium,
          ), // Text
          const SizedBox (height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, 
            children: [
              TextButton(
                onPressed: widget.onSkip, 
                child: Text (widget.skip),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: widget.isLast ? null : widget.onNext, 
                child: Text (widget.next)
              ),
            ]
          )
        ]
      ),
    );
  }
}