// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract SmartContractWallet {
    address payable owner;

    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;
    mapping(address => bool) public guardians;
    mapping(address => mapping(address => bool)) nextOwnerGuardianVotedBool;
    address payable nextOwner;
    uint guardiansResetCounter;
    uint public constant confirmationsFromGuardiansForReset = 3;

    constructor() {
        owner = payable(msg.sender);
    }

    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner");
        guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender], "You are not guardian of this wallet.");
        require(nextOwnerGuardianVotedBool[_newOwner][msg.sender], "You already voted.");
        if(_newOwner != nextOwner) {
            nextOwner = _newOwner;
            guardiansResetCounter = 0;
        }

        guardiansResetCounter++;

        if(guardiansResetCounter >= confirmationsFromGuardiansForReset) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function addGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not the owner.");
        guardians[_guardian] = _isGuardian;
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not the owner.");
        allowance[msg.sender] = _amount;

        if(_amount > 0) {
            isAllowedToSend[_for] = true;
        }else {
            isAllowedToSend[_for] = false;
        }
    }

    function transfer(address _to, uint _amount, bytes memory _payload) public returns (bytes memory){

        if(msg.sender != owner) {
            require(isAllowedToSend[msg.sender], "You are not allowed to send anything from smart contract.");
            require(allowance[msg.sender] >= _amount, "You are trying to send more than you allowed to.");

            allowance[msg.sender] -= _amount;
        }

        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "call wasn't successful...");
        return returnData;
    }
}