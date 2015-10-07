<section id="themes">
	<h2>Themes</h2>
		<p>
			Set your presentation theme: <br>
			<!-- Hacks to swap themes after the page has loaded. Not flexible and only intended for the reveal.js demo deck. -->
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/black.css'); return false;">Black (default)</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/white.css'); return false;">White</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/league.css'); return false;">League</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/sky.css'); return false;">Sky</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/beige.css'); return false;">Beige</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/simple.css'); return false;">Simple</a> <br>
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/serif.css'); return false;">Serif</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/night.css'); return false;">Night</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/moon.css'); return false;">Moon</a> -
			<a href="#" onclick="document.getElementById('theme').setAttribute('href','css/theme/solarized.css'); return false;">Solarized</a>
		</p>
</section>

H:

# Polymorphism

by some [National University of Colombia collaborators](https://github.com/orgs/objetos/people)

H:

# Index

 1. Introduction <!-- .element: class="fragment" data-fragment-index="1"-->
 1. Inheritance <!-- .element: class="fragment" data-fragment-index="2"-->
 1. Polymorphism <!-- .element: class="fragment" data-fragment-index="3"-->
 
H:

## Introduction

We already know:

<li class="fragment"> An object is a _data structure_ for storing user-defined _attributes_ (which may be other objects even of the same type), and _methods_ to manipulate them
<li class="fragment"> To use an object: Declare & initialize it and then call functions on it

V:

## Introduction

We may ask now for ways to relate objects different than inclusion

> That's where Inheritance & Polymorphism comes into the picture

H:

## Inheritance
What is?

> Is when an object or class A is based on another object or class B

V:

## Inheritance
We say:

<li class="fragment"> A is _sublass_ of B
<li class="fragment"> B is _superclass_ of A
<li class="fragment"> A and B form a _class hierarchy_

V:

## Inheritance

<figure>
    <img height='400' src='fig/single_inheritance.jpg' />
    <figcaption>Single inheritance</figcaption>
</figure>

V:

## Inheritance

<figure>
    <img height='400' src='fig/multiple_inheritance.jpg' />
    <figcaption>Multiple inheritance</figcaption>
</figure>

V:

## Inheritance

<figure>
    <img height='400' src='fig/multilevel_inheritance.jpg' />
    <figcaption>Multilevel inheritance</figcaption>
</figure>

V:

## Inheritance
Advantages

<li class="fragment"> It is a mechanism for code reuse
<li class="fragment"> It allows (independent) extensions of the original software via public classes and interfaces

V:

## Inheritance
Example:

> Consider the problem of visually representing some integer sequences as a tile of squares with different hue values

V:

## Inheritance
Example

We are going to declare a _superclass_ *Sequence*
and two _subclasses_ *Fibonacci* and *Padovan*

V:

## Inheritance
Example

```java
// Superclass Sequence
class Sequence {
  color hue;
  int yPos;
  
  Sequence() {
    setHue(120);
    setHeight(height/2);
  }
  
  void setHeight(int h) {
    yPos = h;
  }
  
  int height() {
    return yPos;
  }
  
  void setHue(color h) {
    hue = h;
  }
  
  color hue() {
    return hue;
  }
}
```

V:

## Inheritance
Example

```java
// Subclass Fibonacci
class Fibonacci extends Sequence {
  int compute(int n) {
    if (n == 1)
      return 0;
    if (n == 2)
      return 1;
    if ( n > 2)
      return compute(n-2) + compute(n-1);
    return -1;
  }
  
  void display(int terms) {
    int square_width = width / terms;
    for (int i = 0; i < terms; i++) {
      fill(hue, 100, map(compute(i+1), 0, compute(terms), 0, 100));
      rect(i*square_width, height(), square_width, 50);
    }
  }
}
```

V:

## Inheritance
Example

```java
// Subclass Padovan
class Padovan extends Sequence {
  int compute(int n) {
    if (n == 1 || n == 2 || n == 3)
      return 1;
    if ( n > 3)
      return compute(n-2) + compute(n-3);
    return -1;
  }
  
  void display(int terms) {
    int square_width = width / terms;
    for (int i = 0; i < terms; i++) {
      fill(hue, 100, map(compute(i+1), 0, compute(terms), 0, 100));
      rect(i*square_width, height(), square_width, 50);
    }
  }
}
```

V:

## Inheritance
Example

```java
// Object declaration
Fibonacci fSeq;
Padovan pSeq;
int term = 12;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Object instantiation
  fSeq = new Fibonacci();
  pSeq = new Padovan();
}

void draw() {
  background(0);
  // Object use:
  fSeq.setHeight(mouseY);
  fSeq.display(5);
}

void keyPressed() {
  // Object use:
  println(term + " term Fibonacci value is: " + fSeq.compute(term));
  println(term + " term Padovan value is: " + pSeq.compute(term));
}
```

H:

## Polymorphism
What is?

> is the provision of a single interface to entities of different types
[Bjarne Stroustrup (February 19, 2007). "Bjarne Stroustrup's C++](http://www.stroustrup.com/glossary.html#Gpolymorphism)

V:

## Polymorphism
Types

1. Ad hoc polymorphism <!-- .element: class="fragment" data-fragment-index="1"-->
1. Parametric polymorphism <!-- .element: class="fragment" data-fragment-index="2"-->
1. Subtyping <!-- .element: class="fragment" data-fragment-index="3"-->

H:

## Ad hoc polymorphism

> when a function denotes different implementations depending on a limited range of individually specified types

Supported in many languages via function overloading <!-- .element: class="fragment" data-fragment-index="1"-->

V:

## Function overloading
Continuing our previous example:

```java
// Subclass Padovan
class Padovan extends Sequence {
  int compute(int n) {
    if (n == 1 || n == 2 || n == 3)
      return 1;
    if ( n > 3)
      return compute(n-2) + compute(n-3);
    return -1;
  }
  
  void display(int terms) {
    int square_width = width / terms;
    for (int i = 0; i < terms; i++) {
      fill(hue, 100, map(compute(i+1), 0, compute(terms), 0, 100));
      rect(i*square_width, height(), square_width, 50);
    }
  }
  
  // Method overloading
  void display() {
    display(5);
  }
}
```

V:

## Function overloading
Continuing our previous example:

```java
// Object declaration
Fibonacci fSeq;
Padovan pSeq;
int term = 12;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Object instantiation
  fSeq = new Fibonacci();
  pSeq = new Padovan();
}

void draw() {
  background(0);
  // Object use:
  pSeq.setHeight(mouseY);
  // Call to the overloaded method
  pSeq.display();
}

void keyPressed() {
  // Object use:
  println(term + " term Fibonacci value is: " + fSeq.compute(term));
  println(term + " term Padovan value is: " + pSeq.compute(term));
}
```

H:

## Parametric polymorphism

> when code is written without mention of any specific type and thus can
be used transparently with any number of new types

V:

## Parametric polymorphism
Also known as:

* _Generic programming_ in the OOP community
* _Polymorphism_ in the in the functional programming community

H:

## Subtyping

> when a name denotes instances of many different classes related by some common superclass

V:

## Subtyping
Also known as:

* _Polymorphism_ in the OOP community

V:

## Subtyping
Suppose A is a subtype of B

We not only say:

<li class="fragment"> A is _sublass_ of B
<li class="fragment"> B is _superclass_ of A
<li class="fragment"> A and B form a _class hierarchy_


V:

## Subtyping

but also:

any term of type A can be _safely used_ in a context where a term of type B is expected

V:

## Subtyping
Advantages:

<li class="fragment"> It encourages _data abstraction_
<li class="fragment"> It allows _code simplicity_

V:

## Subtyping
Continuing our previous example:

```java
// Superclass Sequence
abstract class Sequence { 
  abstract int compute(int n);
  
  color hue;
  int yPos;
  
  Sequence() {
    setHue(120);
    setHeight(height/2);
  }
  
  void setHeight(int h) {
    yPos = h;
  }
  
  int height() {
    return yPos;
  }
  
  void setHue(color h) {
    hue = h;
  }
  
  color hue() {
    return hue;
  }
  
  // this function is common among different
  // Sequence subtypes, so we moved it here
  void display(int terms) {
    int square_width = width / terms;
    for (int i = 0; i < terms; i++) {
      fill(hue, 100, map(compute(i+1), 0, compute(terms), 0, 100));
      rect(i*square_width, height(), square_width, 50);
    }
  }
  
  // Method overloading
  void display() {
    display(5);
  }
}
```

V:

## Subtyping
Continuing our previous example:

```java
// Subclass Fibonacci
class Fibonacci extends Sequence {
  Fibonacci() {
    setHue(0);
  }
  
  @Override
  int compute(int n) {
    if (n == 1)
      return 0;
    if (n == 2)
      return 1;
    if ( n > 2)
      return compute(n-2) + compute(n-1);
    return -1;
  }  
}
```

V:

## Subtyping
Continuing our previous example:

```java
// Subclass Padovan
class Padovan extends Sequence {
  Padovan() {
    setHue(180);
  }
  
  @Override
  int compute(int n) {
    if (n == 1 || n == 2 || n == 3)
      return 1;
    if ( n > 3)
      return compute(n-2) + compute(n-3);
    return -1;
  }
}
```

V:

## Subtyping
Continuing our previous example:

```java
// Object declaration
Sequence sequence;
boolean padovan; // false by default, so we begin with Fibonacci

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // We cannot initialize an 'abstract object'
  // only 'concrete' ones:
  sequence = new Fibonacci();
}

void draw() {
  background(0);
  // Object use:
  sequence.setHeight(mouseY);
  sequence.display();
}

void keyPressed() {
  padovan = !padovan;
  // both Fibonacci and Padovan object instances
  // may be assigned to the superclass sequence object:
  sequence = padovan ? new Padovan() : new Fibonacci();
}
```

H:

## References

* [Inheritance](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming)
* [Bjarne Stroustrup (February 19, 2007). "Bjarne Stroustrup's C++](http://www.stroustrup.com/glossary.html#Gpolymorphism)
* [Polymorphism](https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
* [Subtyping](https://en.wikipedia.org/wiki/Subtyping)

V:

## Further reading:

* [Is-a relationship](https://en.wikipedia.org/wiki/Is-a)
* [Java Interfaces](https://en.wikipedia.org/wiki/Interface_(Java)

H:

## Workshop

> Implement a hierarchical design for your integer sequences,
taking into account different visual representations along it