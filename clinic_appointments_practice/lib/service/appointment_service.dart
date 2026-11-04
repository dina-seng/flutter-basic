import '../model/appointment.dart';
import '../model/person.dart';

class AppointmentService {
  static const int openingHour = 8;
  static const int closingHour = 17;

  final List<Doctor> doctors = [];
  final List<Patient> patients = [];
  final List<Appointment> appointments = [];

  // New Service Cancel Appointment
  void cancelAppointment({
    required String patientId,
    required String doctorId,
    required int hour,
  }) {
    // Validation
    if (_findDoctorOrNull(doctorId) == null) {
      throw Exception('Doctor $doctorId is not exists');
    }

    if (_findPatientOrNull(patientId) == null) {
      throw Exception('Patient $patientId is not exists');
    }

    //Check appointment active
    for (Appointment app in appointments) {
      if (app.patient.id == patientId &&
          app.doctor.id == doctorId &&
          app.hour == hour) {
        if (!app.isActive) {
          throw Exception("This appointment already cancel");
        }
        app.status = AppointmentStatus.cancelled;
        return;
      }
    }

    throw Exception("Appointment Not Found");
  }

  void addDoctor({
    required String doctorId,
    required String doctorName,
  }) {
    if (_findDoctorOrNull(doctorId) != null) {
      throw Exception('Doctor $doctorId already exists');
    }

    doctors.add(Doctor(id: doctorId, name: doctorName));
  }

  void addPatient({
    required String patientId,
    required String patientName,
  }) {
    if (_findPatientOrNull(patientId) != null) {
      throw Exception('Patient $patientId already exists');
    }

    patients.add(Patient(id: patientId, name: patientName));
  }

  void bookAppointment({
    required String patientId,
    required String doctorId,
    required int hour,
  }) {
    Patient? patient = _findPatientOrNull(patientId);
    if (patient == null) {
      throw Exception('Patient $patientId not found');
    }

    Doctor? doctor = _findDoctorOrNull(doctorId);
    if (doctor == null) {
      throw Exception('Doctor $doctorId not found');
    }

    if (hour < openingHour || hour >= closingHour) {
      throw Exception('Hour $hour is outside opening hours');
    }

    if (_isDoctorBusy(doctorId, hour)) {
      throw Exception('Doctor $doctorId is not free at $hour');
    }

    if (_isPatientBusy(patientId, hour)) {
      throw Exception(
        'Patient $patientId already has an appointment at $hour',
      );
    }

    appointments.add(
      Appointment(patient: patient, doctor: doctor, hour: hour),
    );
  }

  Doctor? _findDoctorOrNull(String doctorId) {
    for (Doctor d in doctors) {
      if (d.id == doctorId) return d;
    }
    return null;
  }

  Patient? _findPatientOrNull(String patientId) {
    for (Patient p in patients) {
      if (p.id == patientId) return p;
    }
    return null;
  }

  bool _isDoctorBusy(String doctorId, int hour) {
    for (Appointment a in appointments) {
      // if (a.isActive) {
      //   return true;
      // }

      if (a.isActive && a.doctor.id == doctorId && a.hour == hour) return true;
    }
    return false;
  }

  bool _isPatientBusy(String patientId, int hour) {
    for (Appointment a in appointments) {
      if (a.isActive && a.patient.id == patientId && a.hour == hour)
        return true;
    }
    return false;
  }
}
