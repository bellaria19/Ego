import 'package:ego/models/emotion.dart';
import 'package:ego/screens/home/memo_screen.dart';
import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectKeywordScreen extends StatefulWidget {
  const SelectKeywordScreen({
    super.key,
    required this.emotion,
  });

  final EmotionType emotion;

  @override
  State<SelectKeywordScreen> createState() => _SelectKeywordScreenState();
}

class _SelectKeywordScreenState extends State<SelectKeywordScreen> {
  String keyword = '';

  final Map<EmotionType, Color> emotionColors = {
    EmotionType.ecstatic: Colors.green,
    EmotionType.happy: Colors.lime,
    EmotionType.neutral: Colors.yellow,
    EmotionType.unhappy: Colors.orange,
    EmotionType.miserable: Colors.red,
  };

  final Map<EmotionType, List<String>> emotionKeyword = {
    EmotionType.ecstatic: [
      'Euphoria', // 환희
      'Exhilaration', // 희열
      'Passion', // 열정
      'Excitement', // 흥분
      'Joy', // 기쁨
    ],
    EmotionType.happy: [
      'Happiness', // 행복
      'Satisfaction', // 만족
      'Gratitude', // 감사
      'Comfort', // 편안함
      'Positivity', // 긍정
    ],
    EmotionType.neutral: [
      'Neutrality', // 중립
      'Indifference', // 무관심
      'Calmness', // 평온
      'Stability', // 안정
      'Equanimity', // 평정
    ],
    EmotionType.unhappy: [
      'Disappointment', // 실망
      'Sadness', // 슬픔
      'Worry', // 걱정
      'Fatigue', // 피로
      'Discomfort', // 불쾌감
    ],
    EmotionType.miserable: [
      'Despair', // 절망
      'Depression', // 우울
      'Anger', // 분노
      'Fear', // 두려움
      'Helplessness', // 무기력
    ],
  };

  final Map<String, String> emotionDescriptions = {
    'Euphoria': '아주 높은 기쁨이나 행복감을 느끼는 상태.',
    'Exhilaration': '매우 기쁘고 신나는 감정, 흥분된 상태.',
    'Passion': '강렬한 감정이나 열정을 느끼는 상태.',
    'Excitement': '무언가를 기대하면서 생기는 강렬한 감정.',
    'Joy': '깊은 행복감이나 만족감을 느끼는 상태.',
    'Happiness': '전반적으로 긍정적이고 만족스러운 기분.',
    'Satisfaction': '기대가 충족되어 느끼는 기쁨과 평안함.',
    'Gratitude': '누군가에게 감사함을 느끼는 감정.',
    'Comfort': '걱정이나 불안이 없는 안정된 상태.',
    'Positivity': '낙관적인 사고와 감정을 유지하는 상태.',
    'Neutrality': '특정한 감정이 없이 중립적인 상태.',
    'Indifference': '무언가에 대한 관심이나 감정이 없는 상태.',
    'Calmness': '차분하고 안정된 상태.',
    'Stability': '감정적이나 정신적으로 안정된 상태.',
    'Equanimity': '어려운 상황에서도 흔들리지 않는 평온함.',
    'Disappointment': '기대에 미치지 못해 느끼는 슬픔이나 불만.',
    'Sadness': '슬프고 우울한 감정 상태.',
    'Worry': '미래에 대한 불확실성이나 두려움으로 인한 불안감.',
    'Fatigue': '정신적이나 신체적으로 매우 지친 상태.',
    'Discomfort': '신체적, 정신적으로 불편함을 느끼는 상태.',
    'Despair': '희망이 사라지고 모든 것이 끝났다고 느끼는 상태.',
    'Depression': '깊은 슬픔과 절망감, 흥미와 즐거움의 상실.',
    'Anger': '강한 화나 짜증을 느끼는 상태.',
    'Fear': '위험이나 위협을 느껴 불안한 상태.',
    'Helplessness': '상황을 통제할 수 없고 아무것도 할 수 없다고 느끼는 상태.',
  };

  void setKeyword(String selectedKeyword) {
    setState(() {
      keyword = selectedKeyword;
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
                  '어떤 키워드가 어울리나요?',
                  style: GoogleFonts.nanumGothicCoding(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 2,
                ),
                // height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: emotionKeyword.entries.map((entry) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...entry.value.map((keyword) {
                                    return Flexible(
                                      child: ActionChip(
                                        side: BorderSide(
                                          color: emotionColors[entry.key]!,
                                        ),
                                        label: Text(keyword),
                                        onPressed: () {
                                          setKeyword(keyword);
                                        },
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    if (keyword.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 14, top: 4),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        keyword,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 20, top: 4),
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            keyword = '';
                                          });
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.circleXmark),
                                      ),
                                    ),
                                  ],
                                ),
                                ListTile(
                                  title: Text(
                                    emotionDescriptions[keyword]!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                MemoScreen(
                                    emotion: widget.emotion, keyword: keyword),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                      },
                      child: const Text('선택 완료'),
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
}
