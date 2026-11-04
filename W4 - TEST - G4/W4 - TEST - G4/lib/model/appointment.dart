import 'person.dart';

class Appointment {
  final Patient patient;
  final Doctor doctor;
  final int hour;

  Appointment({required this.patient, required this.doctor, required this.hour});
}
