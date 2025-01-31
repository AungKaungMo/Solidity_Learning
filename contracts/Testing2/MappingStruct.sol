// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MappingStruct {
    struct Transition {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalAmount;
        uint numOfDeposit;
        mapping(uint => Transition) deposits;
        uint numOfWithdraw;
        mapping(uint => Transition) withdraws;
    }

    mapping(address => Balance) public balances;

    function getDepositTransition(address _from, uint _numOfDeposit ) public view returns (Transition memory) {
        return balances[_from].deposits[_numOfDeposit];
    }

    function getWithdrawTransition(address _from, uint _numOfWithdraw ) public view returns (Transition memory) {
        return balances[_from].withdraws[_numOfWithdraw];
    }

    function depositAmount() public payable {
        balances[msg.sender].totalAmount += msg.value;
        Transition memory deposit = Transition(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numOfDeposit] = deposit;
        balances[msg.sender].numOfDeposit++;
    }

    function withdrawAmount(address payable _to, uint _amount) public payable {
        balances[msg.sender].totalAmount -= _amount;
        Transition memory withdraw = Transition(_amount, block.timestamp);
        balances[msg.sender].withdraws[balances[msg.sender].numOfWithdraw] = withdraw;
        balances[msg.sender].numOfWithdraw++;
        _to.transfer(_amount);
    }
}