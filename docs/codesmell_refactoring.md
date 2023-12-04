# Large Class:
* Found in most feature classes and files. Large classes which handled all of the functions of the features, often implimented directly into the state.
* Refactoring: Extract Class

# Duplicate Code:
* Found in the use of the button widget. It was found that large blocks of code were used and reused to display buttons.
* Refactoring: Extract Class

# Lazy Class:
* Found in the delete function. It was originally decided for the delete function to be its own class but the class was so small and required so many different dependancies that it was simpler to do the function inline.
* Refactoring: Inline Class

# Shotgun Surgery:
* Found in the delete function. Beacuse the original class required so many dependancies and affected so many different variables and functions within the classes it was used, it was easier to access the funcion inline.
* Refactoring: Inline Class