// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Compare {
    string public myString = "Hello World";
    bytes public myBytes = "Hello";

    function compareToString(string memory _myString) public view returns (bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function compareToByte(string memory _myBytes) public view returns (bool) {
        return keccak256(abi.encodePacked(myBytes)) == keccak256(abi.encodePacked(_myBytes));
    }

    function getStringLength() public view returns (uint) {
        return bytes(myString).length;
    }

    function getBytesLength() public view returns (uint) {
        return myBytes.length;
    }

    function getAddressBalance() public view returns (uint) {
        return msg.sender.balance;
    }

    function getAdd(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}