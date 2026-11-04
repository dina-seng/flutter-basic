import '../model/customer.dart';
import '../model/movie.dart';

class CinemaService {
  final List<Customer> customers = [];
  final List<Movie> movies = [];

  void addCustomer({
    required String customerId,
    required String customerName,
    required int age,
  }) {
    // ! Customer shall not exist already
    if (_findCustomerOrNull(customerId) != null) {
      throw Exception('Customer $customerId already exists');
    }
    customers.add(Customer(id: customerId, name: customerName, age: age));
  }

  void addMovie(
      {required String movieId,
      required String title,
      required int seats,
      int minAge = 0}) {
    // ! Movie shall not exist already
    if (_findMovieOrNull(movieId) != null) {
      throw Exception('Movie $movieId already exists');
    }
    movies.add(Movie(id: movieId, title: title, seats: seats));
  }

  void bookTicket({required String customerId, required String movieId}) {
    // ! Customer shall exist
    Customer? customer = _findCustomerOrNull(customerId);
    if (customer == null) {
      throw Exception('Customer $customerId not found');
    }

    // ! Movie shall exist
    Movie? movie = _findMovieOrNull(movieId);
    if (movie == null) {
      throw Exception('Movie $movieId not found');
    }

    // ! Customer shall not have a ticket for this movie already
    if (_hasTicket(customerId, movie)) {
      throw Exception('Customer $customerId already has a ticket for $movieId');
    }

    // ! Movie shall not be sold out
    if (movie.isSoldOut) {
      throw Exception('Movie $movieId is sold out');
    }

    movie.audience.add(customer);
  }

  Customer? _findCustomerOrNull(String customerId) {
    for (Customer c in customers) {
      if (c.id == customerId) return c;
    }
    return null;
  }

  Movie? _findMovieOrNull(String movieId) {
    for (Movie m in movies) {
      if (m.id == movieId) return m;
    }
    return null;
  }

  bool _hasTicket(String customerId, Movie movie) {
    for (Customer c in movie.audience) {
      if (c.id == customerId) return true;
    }
    return false;
  }
}
