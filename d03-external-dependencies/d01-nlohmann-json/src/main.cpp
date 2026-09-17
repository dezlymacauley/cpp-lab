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

int main() {

    json json_response = {
        // The syntax is:
        // "key": "value"
        {"username", "dezlymacauley"}, 
        {"displayName", "Dezly Macauley"}
    };

    cout << "json_response is " << json_response << "\n";
    // json_response is {"displayName":"Dezly Macauley","username":"dezlymacauley"}
    
    // Updating a value
    json_response["username"] = "nexuslegend";
    json_response["displayName"] = "Nexus Legend";
    
    cout << "json_response is " << json_response << "\n";
    // json_response is {"displayName":"Nexus Legend","username":"nexuslegend"}

    return 0;
}
