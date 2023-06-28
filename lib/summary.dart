import 'package:flutter/material.dart';

class summary extends StatelessWidget {
  const summary({super.key, required this.summarydata});
  final List<Map<String, Object>> summarydata;
  @override
  Widget build(BuildContext context) {
    bool iscorrect = true;
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map(
            (data) {
              if (data['correct-answer'] == data['chosen-answer']) {
                iscorrect = true;
              } else {
                iscorrect = false;
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: iscorrect
                          ? const Color.fromARGB(255, 150, 198, 241)
                          : const Color.fromARGB(255, 249, 133, 241),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      ((data['question-index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 22, 2, 56),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question-text'] as String,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['correct-answer'] as String,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 150, 198, 241)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          data['chosen-answer'] as String,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 249, 133, 241)),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
