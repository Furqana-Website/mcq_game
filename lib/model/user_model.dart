import 'package:flutter/cupertino.dart';
import 'package:mcq_game/NewScreens/MCQtextaudio.dart';

class DataModel {
   String type;
   int level;
   String audio;
   String question;
   List<String> options;
   String correctAnswer;


  DataModel({required this.type, required this.level,  required this.audio, required this.question, required this.options,
    required this.correctAnswer});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      type:json['type'],
      level:json['level'],
      audio:json['audio'],
      question:json['question'],
      options: List<String>.from(json["options"].map((x) => x)),
        correctAnswer:json['correct_answer'],

      //
      // images: List<CorrectAnswer>.from(json['images']),
      // level: json['level'],
      // options: List<String>.from(json['options']),
    );
  }


}

