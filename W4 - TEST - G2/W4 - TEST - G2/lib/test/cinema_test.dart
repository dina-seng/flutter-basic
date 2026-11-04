import 'package:test/test.dart';

import '../service/cinema_service.dart';

void main() {
  test('books a ticket for a movie', () {
    final cinemaService = CinemaService();
    cinemaService.addCustomer(customerId: 'C1', customerName: 'Dara', age: 20);
    cinemaService.addMovie(movieId: 'M1', title: 'Inside Out', seats: 2);

    cinemaService.bookTicket(customerId: 'C1', movieId: 'M1');

    expect(cinemaService.movies.first.audience.length, 1);
    expect(cinemaService.movies.first.audience.first.name, 'Dara');
  });

  test('cannot book a ticket for a sold out movie', () {
    final cinemaService = CinemaService();
    cinemaService.addCustomer(customerId: 'C1', customerName: 'Dara', age: 20);
    cinemaService.addCustomer(customerId: 'C2', customerName: 'Sokha', age: 22);
    cinemaService.addMovie(movieId: 'M1', title: 'Inside Out', seats: 1);

    cinemaService.bookTicket(customerId: 'C1', movieId: 'M1');

    expect(
      () => cinemaService.bookTicket(customerId: 'C2', movieId: 'M1'),
      throwsException,
    );
  });

  test('a customer can book different movies but not the same movie twice',
      () {
    final cinemaService = CinemaService();
    cinemaService.addCustomer(customerId: 'C1', customerName: 'Dara', age: 20);
    cinemaService.addMovie(movieId: 'M1', title: 'Inside Out', seats: 5);
    cinemaService.addMovie(movieId: 'M2', title: 'Up', seats: 5);

    cinemaService.bookTicket(customerId: 'C1', movieId: 'M1');
    cinemaService.bookTicket(customerId: 'C1', movieId: 'M2');

    expect(
      () => cinemaService.bookTicket(customerId: 'C1', movieId: 'M1'),
      throwsException,
    );
  });

  // TODO Q3: add your 2 tests here
}
