import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pink Vibes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pink Vibes ✨'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _totalChanges = 0;

  // Tombol tambah
  void _tambahVibe() {
    setState(() {
      _counter++;
      _totalChanges++;
    });
  }

  // Tombol kurang
  void _kurangiVibe() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _totalChanges++;
      }
    });
  }

  // Tombol reset
  void _resetVibe() {
    setState(() {
      _counter = 0;
      _totalChanges++;
    });
  }

  // Status berdasarkan jumlah counter
  String _getStatus() {
    if (_counter == 0) {
      return 'Let’s start the vibe 🌷';
    } else if (_counter < 5) {
      return 'Just getting started 🌸';
    } else if (_counter < 10) {
      return 'You’re doing great! ✨';
    } else {
      return 'You’re on fire! 🔥';
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_counter / 20).clamp(0.0, 1.0);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F8),

      // APP BAR
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // WELCOME CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pink, Color(0xFFFF80AB)],
                ),
                borderRadius: BorderRadius.circular(24),
              ),

              child: const Column(
                children: [
                  Icon(Icons.favorite, color: Colors.white, size: 50),

                  SizedBox(height: 12),

                  Text(
                    'Hey, welcome! 💗',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Let’s make some magic ✨',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // COUNTER CARD
            Card(
              elevation: 4,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),

              child: Padding(
                padding: const EdgeInsets.all(25),

                child: Column(
                  children: [
                    const Text(
                      'Your Vibe 💕',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      '$_counter',
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),

                    Text(
                      _getStatus(),
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // PROGRESS
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink,
                      backgroundColor: Color(0xFFFFCDD2),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Vibe goal: 20 💕',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // BUTTONS
            Row(
              children: [
                // KURANG
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _kurangiVibe,

                    icon: const Icon(Icons.remove),

                    label: const Text('Oops, minus 😭'),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      foregroundColor: Colors.pink.shade800,

                      padding: const EdgeInsets.symmetric(vertical: 15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // TAMBAH
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _tambahVibe,

                    icon: const Icon(Icons.add),

                    label: const Text('Add Vibe ✨'),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      foregroundColor: Colors.white,

                      padding: const EdgeInsets.symmetric(vertical: 15),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // RESET
            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: _resetVibe,

                icon: const Icon(Icons.refresh),

                label: const Text('Start Over ↻'),

                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.pink,

                  side: const BorderSide(color: Colors.pink),

                  padding: const EdgeInsets.symmetric(vertical: 15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // STATS CARD
            Card(
              elevation: 2,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.auto_awesome, color: Colors.pink),

                        SizedBox(width: 10),

                        Text(
                          'Your Stats 📊',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    const SizedBox(height: 5),

                    // CURRENT VIBE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text('Current vibe'),

                        Text(
                          '$_counter 💗',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // TOTAL MOVES
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text('Total moves'),

                        Text(
                          '$_totalChanges ✨',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FOOTER
            const Text(
              'Created with love & Flutter 💗',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
