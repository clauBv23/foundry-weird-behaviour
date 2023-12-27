// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/Console.sol";

contract ContractA {
    uint256 private s_one;
    uint256 private s_two;
    address private s_delegate;

    function delegateCall(bytes memory data) public {
        console.log("ContractA delegateCall sender", msg.sender);
        console.log("ContractA delegateCall s_delegate", s_delegate);

        (bool success, bytes memory returnData) = s_delegate.delegatecall(data);
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
        console.log("ContractA getOne called", s_one);
        return s_one;
    }

    function setTwo(uint256 two_) public {
        s_two = two_;
    }

    function getTwo() public view returns (uint256) {
        console.log(" ContractA getTwo called", s_two);
        return s_two;
    }
}
