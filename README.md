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


# Assignment 8

1. Explain the difference between Navigator.push and Navigator.pushReplacement

The push method simply adds the current screen/page to the top of the stack. pushReplacement, on the other hand, replaces the previous screen with the current one. For example, I utilized pushReplacement to re-route the user to a fresh App Budget Info page after they've saved the previous information. This is because I don't want the user to be able to go "back" to edit data they've already saved.


2. List all the widgets you used in this project and explain their functions

Scaffold: The basic layout of the app, which includes an AppBar, a body, and a circular button on the right-hand corner. On all pages, a drawer is added, and the body is modified. On the home page, there are 2 buttons (one on the left and one on the right). On the form and display pages, these buttons are omitted.

AppBar: The app bar refers to the blue bar on top of the app. In this particular app, the AppBar simply displays the title of the app and the drawer icon.

Drawer: Used to navigate through pages in the app

ListTile: Displays 1-3 lines of text with a title, an optional subtitle, and includes leading and trailing parameters. This is used in the drawer to display the titles of the available pages. It is also used in the display page to display the budget expense/income information.

Column: Displays children in a vertically.

Row: Displays children horizontally.

Center: Any child within center is automatically centered

Card: Displays a card, complete with a title, subtitle, and options for leading and trailing. Used to display each saved budget information in the display page.

ListView: Displays children in a scroll-able manner.

Form: Groups together various widgets that have a form field

SingleChildScrollView: A box that contains a scroll-able widget

Container: The widget combines other sub-widgets such as padding, decoration, and more

Padding: Provides padding to its child.

TextFormField: A form that accepts text

InputDecoration: Decorates the input using icons, hint texts, borders, and more.

Icon: Displays an icon with customizable colors

OutlineInputBorder: A decoration for inputs that creates a rounded rectangle around said input field.

SizedBox: Creates a box with a specified size

DropdownButton: A button that displays a dropdown list when clicked. The user is able to select items from said dropdown.

TextButton: A button that contains text. Used to save the inputted budget information and to return to the form page once the data has been saved.

Dialog: Displays dialog to the user. This is used to notify the user that the information has been saved.


3. Name the types of events that exist in Flutter (example: onPressed)

onPressed: Refers to when said element (usually a button) is pressed

onChanged: Refers to when an inputted value is changed

onSaved: Refers to an inputted value that has been saved (form.save)

onTap: Refers to when said element (usually elements other than a button) is tapped


4. Explain how the Navigator works in "switching" pages of a Flutter application:

The Navigator is essentially a stack. It has methods such as push, pop, and pushReplacement. Within these methods, MaterialPageRoute() can be called to determine which screen to push or pop. In this case, for example, when a user saves information, a dialog box is shown. When clicking on the "Back" button, the context is popped, meaning the context used to build the dialog box is removed. Then, the Navigator.pushReplacement() is called to replace the current screen (which is the form screen, since the dialog box has been popped) with a new, fresh version of it.


5. Explain how you implemented the checklist above.

I created a drawer by following the basic structure of the code from tutorial 7. The drawer contained a column, which contained ListTile children. Each ListTile widget has a title which refers to the title of the page, and an onTap() function that utilizes the Navigator and MaterialPageRoute to re-route the user to their desired page. Here, I added two new pages, the add budget info, and the budget data.

I then created a new file, form.dart, to create the form. I created a Form() widget in the body that contains various other formatting and sizing widgets. Then, I created a TextFormField for the title, using the hintText, icon, labelText, and border parameters for formatting. I also intialized an empty string for the title to handle the onChanged and onSaved functions. The total amount input was similar, but I added a text filter to only allow numbers. Then, I parsed the String values in onChanged and onSaved to convert it to an integer. For the dropdown, I created a dropdown button with an icon and hint text. I also included the onChanged value to ensure it displays the desired value. Finally, I created a text button to save the data into a list. I created a dialog box that would show when the user clicks on save.

I also created another file to display the data, display.dart. In this file, I created a ListView object and used a for loop to create cards for each item in the list. I displayed its title as well as its price and type.


# Assignment 9

1. Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?

It is possible to do so by decoding the JSON inline using jsonDecode(). However, this returns a Map<String, dynamic>, which means that the types of the values remain unknown until runtime. Thus, it is better to create a model first, as data types can be defined.


2. List the widgets that you used in this project and explain their functions.

Note: The following listed widgets are excluding the ones already used and explained in Assignment 8.

FutureBuilder: A widget that is based on the most recent snapshot of a Future, which is the result of an asynchronous function. In this case, the FutureBuilder is used for displaying the watchlist, as the data is fetched and displayed asynchronously. This also includes the checkbox feature that the user can interact with asynchronously as well.

RichText: Can display text (in one line) with different styles. This is used to display the data in the details page, where some parts of the text are shown in bold, and others are not.

TextSpan: RichText uses TextSpan objects to display the written text, in which the stylization is defined.

Expanded: Expands to fill the available space.

Align: Used to align objects. In this case, it is used to align the button at the bottom of the page using FractionalOffset.

ElevatedButton: A button that is "elevated". Used for the "back" button on the details page.


3. Explain the mechanism of retrieving data from json so it can be shown in Flutter.

To prepare for making HTTP requests, the http package must first be installed. The flutter application should also be provided access to the internet. Once done so, the data (given a URL) is parsed using Uri.parse() and http.get(). The response of the http.get() method is then decoded into JSON, which is then retrieved using the .formJson() method.


4. Explain how you implemented the checklist above.

First, I rearranged my files (with the exception of main.dart) into two separate folders: page, and model. Then, I created a new mywatchlist page within the page folder. I then imported the page in the drawer.dart and added a new ListTile object so users can navigate to the watchlist page.

Then, I created the mywatchlist model page to retrieve the JSON data and convert it. I first used Quicktype to convert the JSON data, but I altered it. This is because the JSON data used for Assignment 3 had the information stored in the sub-field of "fields". Thus, I discarded the "model" and "pk" sub-fields. While iterating through the data, I made sure to only convert the "fields" part of the JSON data.

Then, in the mywatchlist page, I used the FutureBuilder widget to retrieve the latest snapshot of the data and display it asynchronously. I created a card for each data item and utilized a ListTile with a Checkbox as a trailing attribute (to determine whether the movie has been watched or not). I set the initial value to the boolean value from the JSON data. In the onChanged value, I set the new state to the opposite of what it was before (if it was true, it would change to false, and vice versa).

To change the border color, I used a RoundedRectangleBorder as the ListTile's shape, and I used BorderSide to set the border color. I created a function, getBorderColor() that takes in a boolean value and returns a green color if true, and a red color if false. I used the result of this function to set the border color.

The ListTile widget also has an onTap() event, which pushes the Movie Details page. The Movie Details page takes in a "movie" object, which is essentially the entirety of the data item.

The Movie Details Page uses a Padding and Column for the basic formatting. I also used SizedBox and RichTexts to customize the formatting of the displayed data. I then added a button aligned to the bottom of the screen.
