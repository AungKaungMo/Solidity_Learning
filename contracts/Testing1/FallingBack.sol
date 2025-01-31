// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract FallingBack {
    uint public lastSentValue;
    string public lastFunCall;

    receive() external payable {
        lastSentValue = msg.value;
        lastFunCall = "recieve";
     }

    fallback() external payable {
        lastSentValue = msg.value;
        lastFunCall = "fallback";
    }
}