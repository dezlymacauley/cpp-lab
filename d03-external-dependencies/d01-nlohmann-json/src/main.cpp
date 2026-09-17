/*
    ABOUT: JSON

    JSON is a text-based format of structuring data

    It stands for JavaScript Object Notation

    JSON data types:

    1. String =>
        "Dezly Macauley"

    2. Number (includes both integers and floats) =>
        -40
        100
        62.5

    3. Booleans
        true
        false

    4. Objects
        {
            "name": "Dezly"
            "surname": "Macauley"
        }

    5. Arrays
        [ 100, 90, 45 ]
        [ "red", "blue", "green" ]

        you can also have different data types in an array
        [ "purple", true, 89 ]


    6. null (represents a value that is deliberately empty)
        {
            dragonName: null
        }

    ___________________________________________________________________________

    EXAMPLE: 1

    {
        "name": "PlayerOne",
        "score": 42,
        "active": true,
        "bonus": null,
        "achievements": ["First Win"],
        "stats": {
            "level": 3
        }
    }
    ___________________________________________________________________________

    EXAMPLE: 2

    {
        "orderId": "PZ-1024",
        "status": "Preparing",
        "pickup": false,

        "customer": {
            "name": "Frank",
            "city": "Fort Lauderdale"
        },

        "pizza": {
            "size": "Large",
            "toppings": ["Pepperoni", "Mushrooms"],
            "extraCheese": true,
            "price": 17.99
        },
        "paid": true,
        "notes": null
    }
    ___________________________________________________________________________
*/

// External Packages
#include <nlohmann/json.hpp>
using nlohmann::json;

// Standard Library Imports
#include <iostream>
using std::cout;

#include <string>
using std::string;

#include <iomanip>
using std::setw;

int main() {
    
    //_________________________________________________________________________

    // EXAMPLE: 1 => Creating an instance of a `nlohmann/json` class
    
    json json_response = {
        // The syntax is:
        // "key": "value"
        {"username", "dezlymacauley"}, 
        {"displayName", "Dezly Macauley"}
    };

    cout << "json_response is " << json_response << "\n";
    // json_response is {"displayName":"Dezly Macauley","username":"dezlymacauley"}
    
    //_________________________________________________________________________
    
    // EXAMPLE: 2 => Updating a value
    
    json_response["username"] = "nexuslegend";
    json_response["displayName"] = "Nexus Legend";
    
    cout << "json_response is " << json_response << "\n";
    // json_response is {"displayName":"Nexus Legend","username":"nexuslegend"}
    
    //_________________________________________________________________________
   
    // EXAMPLE: 3 => Converting a raw string to JSON

    string ninja_data_as_raw_string = R"(
        {
            "username": "naruto654",
            "age": 30,
            "village": "Hidden Leaf"
        }
    )";

    // Converting the raw string to JSON
    json ninja_data_as_json = json::parse(ninja_data_as_raw_string);

    cout << "ninja_data_as_json: " << ninja_data_as_json << "\n";
    // ninja_data_as_json: {"age":30,"username":"naruto654","village":"Hidden Leaf"}

    //_________________________________________________________________________
    
    // EXAMPLE: 4 => Creating JSON from a raw string

    json jedi_one = json::parse(R"(
        {
            "name": "Larry",
            "age": 45,
            "enrolled": true
        }
    )");

    cout << "jedi_one: " << jedi_one << "\n";
    // jedi_one: {"age":45,"enrolled":true,"name":"Larry"}

    //_________________________________________________________________________
    
    // EXAMPLE: 5 => How to pretty print

    // `setw(2)` means two space indentation.
    cout << "\n" << setw(2) << jedi_one << "\n";
    /*

        {
          "age": 45,
          "enrolled": true,
          "name": "Larry"
        }

    */

    //_________________________________________________________________________
    
    // EXAMPLE: 6 => How to serialize (convert a C++ data structure to JSON)

    json player_one = {
        {"name", "Cassie"},
        {"highscore", 45}
    };

    string player_one_as_json = player_one.dump();

    cout << "player_one_as_json: " << player_one_as_json << "\n";
    // player_one_as_json: {"highscore":45,"name":"Cassie"}

    //_________________________________________________________________________

    return 0;
}
