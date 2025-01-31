// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MappingWithdraw {
    
    mapping(address => uint) public mappingAddress;

    function sendMoney() public payable {
        mappingAddress[msg.sender] += msg.value;
    }

    function getWithdrawBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getSpecificAddress(address _address) public view returns (uint) {
        return  mappingAddress[_address];
    }

    function transferSpecificAddr(address payable _to) public {
        uint payableBalance = mappingAddress[msg.sender];
        mappingAddress[msg.sender] = 0;
        _to.transfer(payableBalance);
    }

}