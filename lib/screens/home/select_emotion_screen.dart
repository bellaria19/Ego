import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectEmotionScreen extends StatefulWidget {
  const SelectEmotionScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const SelectEmotionScreen(),
      // allowSnapshotting: true,
    );
  }

  @override
  State<SelectEmotionScreen> createState() => _SelectEmotionScreenState();
}

class _SelectEmotionScreenState extends State<SelectEmotionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(16)),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.bone)),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // Add your code here
                        },
                        icon: const Icon(FontAwesomeIcons.gear),
                      ),
                    ],
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  shape: const CircleBorder(),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_detail');
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
