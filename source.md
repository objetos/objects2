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

# Objects part 1

by some [National University of Colombia collaborators](https://github.com/orgs/objetos/people)

H:

# Index

 1. Program paradigms (brief overview) <!-- .element: class="fragment" data-fragment-index="1"-->
 1. Using an object <!-- .element: class="fragment" data-fragment-index="2"-->
 1. Declaring an object <!-- .element: class="fragment" data-fragment-index="3"-->
 1. Initializing an object <!-- .element: class="fragment" data-fragment-index="4"-->
 1. Calling object methods <!-- .element: class="fragment" data-fragment-index="5"-->
 
H:

## Introduction

1. Program paradigms brief overview
1. Object Oriented Programming (OPP) Paradigm

V:

## Introduction: Program paradigms

> A fundamental style of computer programming, serving as a way of building the programs

more [here](http://objetos.github.io/structured_programming)

V:

## Introduction: Program paradigms

1. Machine code
2. Asembly language
3. Structured Programming (SP is detailed [here](http://objetos.github.io/structured_programming))
4. Object Oriented Programming (OOP)
5. Other paradigms
  * [Declarative programming](https://en.wikipedia.org/wiki/Declarative_programming)
  * [Functional programming](https://en.wikipedia.org/wiki/Functional_programming)
  * [Logic programming](https://en.wikipedia.org/wiki/Logic_programming)
  * [Symbolic programming](https://en.wikipedia.org/wiki/Symbolic_programming)

V:

## Introduction: OOP

Langs that described programs as a group of mutually interactive _objects_

<li class="fragment"> An object is a _data structure_ for storing user-defined _attributes_ (data or fields), and _methods_ to manipulate them

H:

## Using an object

> Consider the problem of visually representing the Fibonacci sequence as a tile of squares with different hue values

V:

## Using an object
An SP design would require:

1. Data (Global Variables)
  * Fibonacci terms (```squares```)
  * Hue value
2. Setup
  * Initialize hue value
3. Draw:
  * for_each square:
    compute_color,
    draw

V:

## Using an object
SP implementation

```java
// 1. Global variables
int squares;
color hue;

int fibonacci(int n) {
  if(n == 1)
    return 0;
  if(n == 2)
    return 1;
  if( n > 2)
    return fibonacci(n-2) + fibonacci(n-1);
  return -1; 
}

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  squares = 5;
  // 2. Initialize data
  hue = 90;
  noLoop();
}

// 3. Implement the functionality
void draw() {
  int square_width = width / squares;
  for(int i = 0; i < squares; i++) {
    fill(hue, 100, map(fibonacci(i+1), 0, fibonacci(squares), 0, 100));
    rect(i*square_width,0,square_width,50);
  }
}

```

V:

## Using an object

<li class="fragment"> OOP allows us to take all of the variables and functions out of the main program and store them inside a _Fibonacci object_
<li class="fragment"> A _Fibonacci object_ will know about its _data_ (hue)
<li class="fragment"> The object will also know about the _methods_ to manipulate its _data_ (_compute_,_display_, etc.)

V:

## Using an object
In our case an OOP design would thus require:

* Data (Global Variables)
  Fibonacci object
* Setup
  Initialize the Fibonacci object
* Draw
  Display the Fibonacci object

V:

## Using an object
...something like this:

```java
// Step 1. Declare an object
Fibonacci sequence;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Step 2. Initialize object
  sequence = new Fibonacci();
  noLoop();
}

void draw() {
  // Step 3. Call methods on the object
  sequence.display(10);
}
```

V:

## Using an object
where the Fibonacci object may be implemented as:

```java
class Fibonacci {
  color hue = 90;
  
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
      rect(i*square_width, 0, square_width, 50);
    }
  }
}
```

H:
 
## Declaring an object

Remember how it's done with primitive data types

```java
int var;
```

V:
 
## Declaring an object

in OOP it's done similarly:

```java
Fibonacci sequence;
```

H:

## Initializing an object

Remember how it's done with primitive data types

```java
var = 10;
```

V:

## Initializing an object

in OOP it's done with an 'object constructor'

```java
sequence = new Fibonacci();
```

The constructor that takes no arguments is known as the default constructor.
They don't require an explicit implementation that others do. <!-- .element: class="fragment" data-fragment-index="1"-->

V:

## Initializing an object

> Suppose now that we want our Fibonacci visual representation to change its placement according to our mouse y-position

V:

## Initializing an object

We could declare a new Fibonacci attribute to represent its visual placement:

```java
int yPos;
```

V:

## Initializing an object

and two methods to set/get its value:

```java
void setHeight(int h) {
    yPos = h;
  }
  
  int height() {
    return yPos;
  }
```

V:

## Initializing an object

finally, we can also implement a non-default constructor to set out ```height()``` attribute:

```java
Fibonacci(int h) {
 setHue(h);
}

```

V:

## Initializing an object

our global data, ```setup()``` and ```draw()``` global methods will now look like:

```java
Fibonacci sequence;

void setup() {
  size(720,640);
  colorMode(HSB, 360, 100, 100);
  // Note here the new non-default constructor call
  sequence = new Fibonacci(120);
}

void draw() {
  background(0);
  sequence.setHeight(mouseY);
  sequence.display(10);
}
```

V:

## Initializing an object

an our ```Fibonacci``` implementation like this:

```java
class Fibonacci {
  color hue;
  int yPos;
  
  Fibonacci(int h) {
    setHue(h);
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
      // note that we now pass our height() attribute
      // as a parameter type to the Processing rect() method
      rect(i*square_width, height(), square_width, 50);
    }
  }
}
```

H:

## Calling object methods
Functions are called with the "dot syntax", like this:

```java
sequence.setHeight(mouseY);
sequence.display(10);

```

H:

## References

* [Daniel Shiftman Objects tutorial](https://processing.org/tutorials/objects/)
* [Processing "class"](https://processing.org/reference/class.html)
* [Processing "object"](https://processing.org/reference/Object.html)
