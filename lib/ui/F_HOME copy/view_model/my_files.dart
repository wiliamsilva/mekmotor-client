import 'package:mekmotorclient/utils/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Agenda",
    numOfFiles: 1328,
    svgSrc: "assets/icons/agenda.svg",
    totalStorage: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Checklist",
    numOfFiles: 1328,
    svgSrc: "assets/icons/checklist.svg",
    totalStorage: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Orçamento",
    numOfFiles: 1328,
    svgSrc: "assets/icons/orcamento.svg",
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Recebimento",
    numOfFiles: 5328,
    svgSrc: "assets/icons/recebimento.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
  CloudStorageInfo(
    title: "Funilaria",
    numOfFiles: 5328,
    svgSrc: "assets/icons/funilaria.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
  CloudStorageInfo(
    title: "Pintura",
    numOfFiles: 5328,
    svgSrc: "assets/icons/pintura.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
  CloudStorageInfo(
    title: "Lava-jato",
    numOfFiles: 5328,
    svgSrc: "assets/icons/lavajato.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
  CloudStorageInfo(
    title: "Entrega",
    numOfFiles: 5328,
    svgSrc: "assets/icons/entrega.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
