pragma solidity ^0.4.19;

contract Bank {

    mapping(address => uint256) public balanceOf;
    address owner;    // current owner of the contract

    function Bank() public { // constructor
        owner = msg.sender; // msg.sender is the contract caller (address of contract creator)
    }

    function withdraw(uint256 amount) public {
        require(owner == msg.sender); // only allows owner of the account to withdraw.
        balanceOf[msg.sender] -= amount;
        msg.sender.transfer(address(this).balance);
    }

    function deposit(uint256 amount) public payable {
        require(msg.value == amount); // anyone can deposit in the bank.
        balanceOf[msg.sender] += amount;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}