// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract BlockchainMessenger {
    uint public messageCounter;
    string public message;
    address public myAddress;

    constructor() {
        myAddress = msg.sender;
    }

    function updateMessage(string memory _message) public {
        if(myAddress == msg.sender) {
            message = _message;
            messageCounter++;
        }
    }
}