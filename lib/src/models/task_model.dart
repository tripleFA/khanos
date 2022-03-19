// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  TaskModel({
    this.id,
    this.title,
    this.description,
    this.dateCreation,
    this.colorId,
    this.projectId,
    this.columnId,
    this.ownerId,
    this.position,
    this.isActive,
    this.dateCompleted,
    this.score,
    this.dateDue,
    this.categoryId,
    this.creatorId,
    this.dateModification,
    this.reference,
    this.dateStarted,
    this.timeSpent,
    this.timeEstimated,
    this.swimlaneId,
    this.dateMoved,
    this.recurrenceStatus,
    this.recurrenceTrigger,
    this.recurrenceFactor,
    this.recurrenceTimeframe,
    this.recurrenceBasedate,
    this.recurrenceParent,
    this.recurrenceChild,
    this.priority,
    this.url,
  });

  Map<String, Color> taskColors = {
    "yellow": Colors.yellow[600],
    "blue": Colors.blue,
    "green": Colors.green,
    "purple": Colors.purple,
    "red": Colors.red,
    "orange": Colors.orange,
    "grey": Colors.grey,
    "brown": Colors.brown,
    "deep_orange": Colors.deepOrange,
    "dark_grey": Colors.grey[850],
    "pink": Colors.pink,
    "teal": Colors.teal,
    "cyan": Colors.cyan,
    "lime": Colors.lime,
    "light_green": Colors.lightGreen,
    "amber": Colors.amber,
  };

  Map<Color, String> taskColorsName = {
    Colors.yellow: "yellow",
    Colors.blue: "blue",
    Colors.green: "green",
    Colors.purple: "purple",
    Colors.red: "red",
    Colors.orange: "orange",
    Colors.grey: "grey",
    Colors.brown: "brown",
    Colors.deepOrange: "deep_orange",
    Colors.pink: "pink",
    Colors.teal: "teal",
    Colors.cyan: "cyan",
    Colors.lime: "lime",
    Colors.lightGreen: "light_green",
    Colors.amber: "amber",
  };

  List<ColorSwatch> taskColorsList = [
    Colors.yellow,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.grey,
    Colors.brown,
    Colors.deepOrange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lime,
    Colors.lightGreen,
    Colors.amber,
  ];

  String id;
  String title;
  String description;
  String dateCreation;
  String colorId;
  String projectId;
  String columnId;
  String ownerId;
  String position;
  String isActive;
  String dateCompleted;
  String score;
  String dateDue;
  String categoryId;
  String creatorId;
  String dateModification;
  String reference;
  String dateStarted;
  String timeSpent;
  String timeEstimated;
  String swimlaneId;
  String dateMoved;
  String recurrenceStatus;
  String recurrenceTrigger;
  String recurrenceFactor;
  String recurrenceTimeframe;
  String recurrenceBasedate;
  String recurrenceParent;
  String recurrenceChild;
  String priority;
  String url;

  Color getTaskColor(String colorName) {
    return taskColors[colorName];
  }

  String getTaskColorName(Color color) {
    return taskColorsName[color];
  }

  List<ColorSwatch> getTaskColorsList() {
    return taskColorsList;
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"].toString(),
        title: json["title"],
        description: json["description"],
        dateCreation: json["date_creation"].toString(),
        colorId: json["color_id"],
        projectId: json["project_id"].toString(),
        columnId: json["column_id"].toString(),
        ownerId: json["owner_id"].toString(),
        position: json["position"].toString(),
        isActive: json["is_active"].toString(),
        dateCompleted: json["date_completed"],
        score: json["score"].toString(),
        dateDue: json["date_due"].toString(),
        categoryId: json["category_id"].toString(),
        creatorId: json["creator_id"].toString(),
        dateModification: json["date_modification"].toString(),
        reference: json["reference"],
        dateStarted: json["date_started"].toString(),
        timeSpent: json["time_spent"].toString(),
        timeEstimated: json["time_estimated"].toString(),
        swimlaneId: json["swimlane_id"].toString(),
        dateMoved: json["date_moved"].toString(),
        recurrenceStatus: json["recurrence_status"]?.toString(),
        recurrenceTrigger: json["recurrence_trigger"]?.toString(),
        recurrenceFactor: json["recurrence_factor"].toString(),
        recurrenceTimeframe: json["recurrence_timeframe"].toString(),
        recurrenceBasedate: json["recurrence_basedate"].toString(),
        recurrenceParent: json["recurrence_parent"].toString(),
        recurrenceChild: json["recurrence_child"]?.toString(),
        priority: json["priority"].toString(),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date_creation": dateCreation,
        "color_id": colorId,
        "project_id": projectId,
        "column_id": columnId,
        "owner_id": ownerId,
        "position": position,
        "is_active": isActive,
        "date_completed": dateCompleted,
        "score": score,
        "date_due": dateDue,
        "category_id": categoryId,
        "creator_id": creatorId,
        "date_modification": dateModification,
        "reference": reference,
        "date_started": dateStarted,
        "time_spent": timeSpent,
        "time_estimated": timeEstimated,
        "swimlane_id": swimlaneId,
        "date_moved": dateMoved,
        "recurrence_status": recurrenceStatus,
        "recurrence_trigger": recurrenceTrigger,
        "recurrence_factor": recurrenceFactor,
        "recurrence_timeframe": recurrenceTimeframe,
        "recurrence_basedate": recurrenceBasedate,
        "recurrence_parent": recurrenceParent,
        "recurrence_child": recurrenceChild,
        "priority": priority,
        "url": url,
      };

  // Color getColor();
}
