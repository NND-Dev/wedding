// Base Bloc Implementation

abstract class BaseBloc<Event, State> {
  void add(Event event);
  void emit(State state);
  // Other base functionalities
}
