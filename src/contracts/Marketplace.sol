pragma solidity ^0.5.0;

contract Marketplace {
    string public name;
    uint public productCount = 0;
    mapping(uint => Product) public products;

    struct Product {
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased;
    }

    event ProductCreated (
        uint id,
        string name,
        uint price,
        address owner,
        bool purchased
    );

    constructor() public {
        name = "Marketplace Application";
    }

    function createProduct(string memory _name, uint _price) public {
        //Require a valid name 

        require(bytes(name).length > 0);

        //Require a valid price

        require(_price > 0);

        //Increament product count 

        productCount++;

        //create the product 

        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        
        //Trigger an event

        emit ProductCreated(productCount, _name, _price, msg.sender, false);
    }

}