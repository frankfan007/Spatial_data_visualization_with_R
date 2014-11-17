

A class describes the general properties of a group of objects and everything in R is an object. Functions are actions performed on objects and the type of action (method) depends on the object class. More specifically, there are generic functions including a set of methods and when a generic function is called, the R evaluator selects a method from those available, by examining how well different methods match the classes of actual arguments in the call (chambers).

R has four object oriented systems. The first and simpler system, S3, is the most commonly used in CRAN packaegs (hadley). In S3, classes are not formally defined and methods are selected using the class of a single argument of the generic function (typically the first) (bioinfo). S4 is similar to S3 but adds formality and rigour making it more complex (haddley). However, this complexity is more appropriate for larger and more complex software such as those used for spatial data analsysis and visualization.

In S4, classes have formal definitions which describe their fields and inheritance structure (hadley). Also, methods can be selected based on more than one argument. The fields of a class are known as solts and they can be accessed using the special operator `@` or the function `slot()`. Inheritance refers to definition of new classes in terms of existing classes. Thus, new classes inherit the slots of existing classes and extend it adding new slots. A new class is a sublcass from the classes it extend and the extended class is a superclass of the classes that inherit from it. For a detailed description of functional, oject-based systems in R, see ().

The foundation class for spatial objects is `Spatial` and it is extended by several subclasses that create a powerful environment to represent, manipulate and visualize vector and raster data.

This section has recepies to display the structure of spatial objects and access their slots. Spatial object are usually read from files but can also be built fromother R objects. For some classes, the recepies include the process to build and object. These recepies are the basis to understand the rationale behind spatial data manipulation in R and are used throughout the book.


















