// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ContractOne {

    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {
        addressBalances[msg.sender] += msg.value;
    }
}

contract ContractTwo {

    function deposit() public payable {}

    function depositOnContractOne(address _contractOne) public { 
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}