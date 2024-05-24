import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> names = [
    'Imran Khan',
    'Nawaz Sharief',
    'Asif Ali Zardari',
    'Pervaze Ilahi',
    'Aleem'
  ];
  List<int> counter = <int>[
    0,
    0,
    0,
    0,
    0,
  ];

  void _showResultsDialog() {
    int totalVotes = counter.reduce((value, element) => value + element);
    String results = '';
    for (int i = 0; i < names.length; i++) {
      results += '${names[i]}: ${counter[i]} votes\n';
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Final Results'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(results),
              const SizedBox(height: 20),
              Text('Total Votes: $totalVotes',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text(
          "Voting App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Vote For Candidates",
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  names[index],
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                              Text(
                                "${counter[index]}",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                              const SizedBox(
                                width: 60.0,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    counter[index]++;
                                  });
                                },
                                child: const Text("Vote"),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.print),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: _showResultsDialog,
        label: const Text("Final Result"),
      ),
    );
  }
}
