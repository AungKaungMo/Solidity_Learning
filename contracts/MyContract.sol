// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyContract {

    uint[] public uintArray = [1,2,3];
    string[] public stringArray = ["apple", "banana", "carrot"];
    string[] public values;
    uint256[][] public array2D = [[1,2,3], [1,2,3]];

    struct Book {
        string title;
        string author;
    }

    mapping(uint => Book) public books;
    mapping(address => mapping(uint => Book)) public myBooks;

    function addValue(string memory _value) public {
        values.push(_value);
    }

    function getValueCount() public view returns (uint) {
        return values.length;
    }

   function addBook(
        uint _id,
        string memory _title,
        string memory _author 
    ) public {
        books[_id] = Book(_title, _author);
    }

    function addMyBook(
        uint _id,
        string memory _title,
        string memory _author 
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }

    function getAddress() public view returns (address) {
        return msg.sender;
    }
}