import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart'; 
import 'package:quiz_app/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build( BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data)
             {
          return SummaryItem(data);
        },
        ).toList(),
        ),
      ),
    );
  }
}



 // Row(
          //   children: [
          //     Text(((data['question_index'] as int)+ 1).toString()),
          //     Expanded(
          //       child: Column(children: [
          //         Text(data['question'] as String, 
          //         style: GoogleFonts.lato(color: Colors.white, fontSize: 18)
          //         ),
          //         const SizedBox(height: 5,),
          //         Text(data['user_answer'] as String,
          //         style: GoogleFonts.lato(color: const Color.fromARGB(150, 255, 255, 255), fontSize: 15, )
          //         ),
          //         Text(data['correct_answer'] as String,
          //         style: GoogleFonts.lato(color: const Color.fromARGB(255, 48, 172, 194), fontSize: 15)
          //         ),
          //       ]),
          //     ),
          //   ],
          // );