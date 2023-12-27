// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Console.sol";

contract ContractA {
    uint256 private s_one;
    uint256 private s_two;
    address private s_delegate;

    function delegateCall(bytes memory data) public {
        console.log("ctr A delegateCall called", msg.sender);
        console.log("ctr A s_delegate", s_delegate);

        (bool success, bytes memory returnData) = s_delegate.delegatecall(data);
        // console.log("returnData", abi.decode(returnData, (uint256)));
        require(success, string(returnData));
    }

    function setDelegate(address delegate_) public {
        s_delegate = delegate_;
    }

    function getDelegate() public view returns (address) {
        return s_delegate;
    }

    function setOne(uint256 one_) public {
        s_one = one_;
    }

    function getOne() public view returns (uint256) {
        console.log("getOne ctr A called", s_one);

        return s_one;
    }

    function setTwo(uint256 two_) public {
        s_two = two_;
    }

    function getTwo() public view returns (uint256) {
        console.log("getTwo ctr B called", s_two);
        return s_two;
    }
}
