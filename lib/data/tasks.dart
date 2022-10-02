import 'package:flutter/material.dart';
import 'package:trello_like_mobile_app/model/task.dart';

final status = [
  'LOW',
  'HIGH',
  'LOW',
  'HIGH',
];

final person = [
  'assets/marina.png',
  'assets/appo.png',
  'assets/nana.png',
  'assets/marina.png',
];

final title = [
  'Design for Website eCommerce',
  'Slicing Template to Notion',
  'Working Together With Developers',
  'Preparing for Freelance Contracts'
];

final deadline = [
  'Deadline at Aug 22, 1996',
  'Deadline at Jan 09, 2000',
  'Deadline at Mar 13, 2010',
  'Deadline at Feb 8, 2022',
];

final cover = [
  'assets/cover.png',
  'null',
  'assets/cover2.png',
  'null',
];

List<Task> getTasks() => List.generate(
      status.length,
      (index) => Task(
        title: title[index],
        status: status[index],
        deadline: deadline[index],
        cover: cover[index],
        person: person[index],
      ),
    );
