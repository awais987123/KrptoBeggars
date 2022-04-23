//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Transaction{
    uint transCount;
    event Transfer(address from, address to, uint amount, string message, uint timestamp, string keyword);

    struct TransactionStruct{
        address sender;
        address reciever;
        uint amount;
        string message;
        uint timestamp;
        string keyword;
    }

    TransactionStruct[] transactions;

    function AddToBlock(address payable reciver,uint amount, string memory message, string memory keyword ) public{
        transCount +=1;
        transactions.push(TransactionStruct(msg.sender, reciver,amount,message, block.timestamp,keyword));
        emit Transfer(msg.sender, reciver,amount,message, block.timestamp,keyword);


    }

    function getAllTractions() public view returns(TransactionStruct[] memory)
    {
        return transactions;

    }

    function getAllTractionsCount() public view returns(uint)
    {
        return transCount;

    }


}
