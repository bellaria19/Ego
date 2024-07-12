import 'package:ego/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MemoScreen extends StatefulWidget {
  // final Function(String) onMemoSubmitted;

  const MemoScreen({
    super.key,
    //  required this.onMemoSubmitted
  });

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  String memo = '';
  final TextEditingController controller = TextEditingController();

  void setMemo(String memoText) {
    setState(() {
      memo = memoText;
      Navigator.of(context).pushReplacement(MainScreen.route());
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
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '간단한 메모를 입력해보세요',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.black),
                          child: const Text('건너뛰기'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MainScreen.route(), (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
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
  // @override
  // Widget build(BuildContext context) {
  //   final TextEditingController controller = TextEditingController();

  //   return Scaffold(
  //     appBar: AppBar(
  //       actions: [
  //         IconButton(
  //           onPressed: () {
  //             Navigator.of(context).pushReplacement(MainScreen.route());
  //           },
  //           icon: const Icon(FontAwesomeIcons.xmark),
  //         ),
  //       ],
  //     ),
  //     body: Container(
  //       decoration: const BoxDecoration(
  //         image: DecorationImage(
  //           image: AssetImage('assets/background/home.jpg'),
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               '메모를 입력하세요',
  //               style: GoogleFonts.nanumGothicCoding(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.w700,
  //               ),
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16.0),
  //               child: TextField(
  //                 controller: controller,
  //                 decoration: const InputDecoration(
  //                   border: OutlineInputBorder(),
  //                   labelText: '메모',
  //                 ),
  //                 maxLines: 4,
  //               ),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 setMemo(controller.text);
  //               },
  //               child: const Text('저장'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
