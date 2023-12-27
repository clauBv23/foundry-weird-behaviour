// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

import {ContractA} from "./ContractA.sol";

contract ContractB is Script {
    uint256 private s_one;
    uint256 private s_two;

    bytes4 constant getOneSignature = bytes4(keccak256("getOne()"));
    bytes4 constant getTwoSignature = bytes4(keccak256("getTwo()"));

    function setOne(uint256 one_) public {
        s_one = one_;
    }

    function getOne() public view returns (uint256) {
        console.log("ContractB getOne called", s_one);
        return s_one;
    }

    function set_tTwo(uint256 two_) public {
        s_two = two_;
    }

    function getTwo() public view returns (uint256) {
        console.log("ContractB getTwo called", s_two);
        return s_two;
    }

    function weirdBehaviour() public {
        // deploy ContractA
        ContractA contractA = new ContractA();
        console.log("ContractA deployed at", address(contractA));
        console.log("ContractB deployed at", address(this));
        // set this contractB (this contract) as delegate
        contractA.setDelegate(address(this));
        // set one and two on ContractA
        contractA.setOne(1);
        contractA.setTwo(2);
        // delegate call to get both values from ContractA
        contractA.delegateCall(abi.encodeWithSelector(getOneSignature));
        contractA.delegateCall(abi.encodeWithSelector(getTwoSignature));
    }

    function expectedBehaviour() public {
        console.log("ContractB deployed at", address(this));
        // deploy ContractA
        ContractA contractA = new ContractA();
        console.log("ContractA deployed at", address(contractA));
        console.log("ContractB deployed at", address(this));
        ContractBNoScript contractBNoScript = new ContractBNoScript();
        console.log(
            "ContractBNoScript deployed at",
            address(contractBNoScript)
        );
        // set this contractB no script as delegate
        contractA.setDelegate(address(contractBNoScript));
        // set one and two on ContractA
        contractA.setOne(1);
        contractA.setTwo(2);
        // delegate call to get both values from ContractA
        contractA.delegateCall(abi.encodeWithSelector(getOneSignature));
        contractA.delegateCall(abi.encodeWithSelector(getTwoSignature));
    }

    function run() public {
        vm.startBroadcast();
        console.log(
            "--------------------------------WEIRD BEHAVIOUR--------------------------------"
        );
        weirdBehaviour();
        console.log(
            "--------------------------------EXPECTED BEHAVIOUR--------------------------------"
        );
        expectedBehaviour();
        vm.stopBroadcast();
    }
}

contract ContractBNoScript {
    uint256 private s_one;
    uint256 private s_two;

    function setOne(uint256 one_) public {
        s_one = one_;
    }

    function getOne() public view returns (uint256) {
        console.log("ContractBNoScript getOne called", s_one);
        return s_one;
    }

    function set_tTwo(uint256 two_) public {
        s_two = two_;
    }

    function getTwo() public view returns (uint256) {
        console.log("ContractBNoScript getTwo called", s_two);
        return s_two;
    }
}
