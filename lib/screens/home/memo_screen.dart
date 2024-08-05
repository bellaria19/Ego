import 'package:ego/models/emotion.dart';
import 'package:ego/screens/home/select_quest_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:ego/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({
    super.key,
    required this.emotion,
    required this.keyword,
  });

  final EmotionType emotion;
  final String keyword;

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  String memo = '';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void setMemo(String newMemo) {
    setState(() {
      memo = newMemo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MainScreen.route());
            },
            icon: const Icon(FontAwesomeIcons.xmark),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  '메모를 입력하시겠어요?',
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MemoField(
                        // focusNode: _focusNode,
                        controller: _textController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setMemo('');
                            _navigateToSelectQuest();
                            makeEmotionItem(widget.emotion, widget.keyword, '');
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                          child: const Text(
                            '건너뛰기',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: _textController.text.isNotEmpty
                              ? () {
                                  setMemo(_textController.text);
                                  _navigateToSelectQuest();
                                  makeEmotionItem(
                                    widget.emotion,
                                    widget.keyword,
                                    memo,
                                  );
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black),
                          child: const Text('완료하기'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSelectQuest() {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SelectQuestScreen(keyword: widget.keyword),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
      ),
    );
  }

  void makeEmotionItem(EmotionType emotion, String keyword, String memo) {
    Emotion newEmotion = Emotion(
      date: DateTime.now(),
      emotion: emotion,
      keyword: keyword,
      memo: memo,
    );
    firestoreService.addEmotion(newEmotion);
    debugPrint(
        'date: ${newEmotion.date}\n emotion: ${newEmotion.emotion}\n keyword: ${newEmotion.keyword}\n memo: ${newEmotion.memo}');
  }
}

class MemoField extends StatelessWidget {
  const MemoField({
    super.key,
    // this.focusNode,
    this.controller,
  });

  // final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      maxLines: null,
      autofocus: true,
      // focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: 'Write a text',
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
