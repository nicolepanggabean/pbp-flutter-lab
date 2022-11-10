# Assignment 7

1. Explain what is meant by stateless widget and stateful widget and explain the difference between them.

A stateless widget is a widget that doesn't change. These include widgets such as Text or Icon. On the other hand, stateful widgets are widgets that are dynamic in the sense that it can change. Examples are Sliders, Forms, TextFields, and more.


2. Mention what widgets you use in this project and explain their functions

This project utilizes the text widget to display the counter and whether it is even or odd. The project also uses the floating action button to increment or decrement the counter.


3. What is the function of setState()? Explain what variables can be affected by the function.

The setState() function essentially tells the framework to rebuild the state object when a change occurs. In this case, setState() is used for the increment and decrement functions. Without the setState() function, the framework wouldn't schedule a build, and therefore, no changes would be seen. Thus, the increment and decrement functions wouldn't necessarily have an effect on the counter.


4. Explain the difference between const and final.

The "final" keyword can only be set once, and is initialized during run-time when it is accessed. On the other hand, the "const" variable is initialized during compile-time, meaning that even when it is not accessed, it will be initialized and will take up space. Classes can have final variables, but not const variables. Furthermore, const variables cannot handle data calculated at runtime (such as DateTime.now())


5. Explain how you implemented the checklist above.

First, I created a flutter app. The app already had an _incrementCounter() function to increase the value in the counter, so I followed its structure to ccreate a _decrementCounter() function. Then, I created a testEven() method within the _MyHomePageState class to test whether the counter is even or odd. If even, I return a const Text object that says "EVEN" in red using the style parameter. If odd, I return a const Text object that says "ODD" in blue using the style parameter. I called this function just before the counter is displayed, within the children: <Widget> area. Finally, I added another action button that uses the _decrementCounter() function and added padding and centered it so the buttons were visually symmetrical.
