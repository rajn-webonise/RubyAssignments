# Collection Holder Assignment

* Made a gem to implement a collection holder that keeps track of all queues in your program.
* Deployed it on [rubygems.org](https://rubygems.org/gems/collection-holder).

## How to install the gem?
`gem install collection-holder`

## How to run this gem?
Create a `.rb` file with following line:
```
require 'collection-holder'

# your code
```

## What is a collection?
Simply put, it's a data structure to hold data. Queues, stack, tree, set are types of collections.

## What does Collection Holder do?

It is used to manage (add/create/display/delete) your collections in one place. The current manager holds only 1 type of collection: `Que`.

## Public Methods:

### CollectionHolder Class:

*  **`CollectionHolder.new()`**  
    Creates a *Collection Holder* instance object. Takes no parameters.
*  **`add(collection)`**  
    Adds the passed `collection` object to its `list`
* **`get(id)`**  
    Finds and returns the `collection` object having ID as `id`.
* **`display_all()`**  
    Displays all the collections present in the list along with `ID` and `TYPE` and contents if possible. (content doesn't apply to Que).

* **`delete(id)`**  
    Deletes the `collection` object having ID as `id` from the `list`



### Que Class:

*  **`Que.new(data=nil)`**  
    Creates a Collection instance object. Takes a hash parameter with 2 valid fields: `size` (defines max_size of Que) `list` (populates the que with this list). `data` defaults to nil.
*  **`pop()`**  
    Pops out the last object pushed in the `que`.
* **`push(item)`**  
    Pushes (inserts) the passed object `item` into the `que`.
*  **`clear()`**  
    Clears the `que`, deletes every value.
* **`length()` or `size()`**  
    Returns count of objects in the `que`.
* **`push_list(list)`**  
    Takes an Array parameter `list` and appends its values to the `que`.
* **`display()`**  
    Prints details or address of the `que`.

## How to contribute?

* Go through the above documentation.
* Currently, this gem supports only Queue data structure. You can add extensions for Stack, Set, Tree.

*  **How to add a new data structure?**  
 Simply create a new class file for a data structure and write its implementation. The method `add(collection)` in CollectionManager class will store all types of collections, and assigns them an `id` by default.

* **What should be the structure of the class?**  
 The class can have any methods it deems fitting. However, it should have the following 2 accessors/methods:  
`display()` : Returning the identity of the object as a string.  
`type()`: Returns a string. Denoting the data-structure of the object.   
 * **Optional**  
The initialization parameter can take the following fields in a single hash:     
(The hash symbols have to be exact)  
`max_size:`: Maximum allowed entries in the structure.  
`list:`: Populate the structure with this `list` by default.
