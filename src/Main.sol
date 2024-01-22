// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Main {

    uint256 public verySpecialVar;
    uint256 public notSoSpecialVar;
    // delegate calls SpecialVarManager to update verySpecialVar
    function setVerySpecialVar(address _specialVarManager) external {
        _specialVarManager.delegatecall(
            abi.encodeWithSignature("writeSpecialVar()")
        );
    }
    // delegate calls NotSpecialVarManager to update notSoSpecialVar
    function setNotSoSpecialVar(address _notSpecialVarManager) external {
        _notSpecialVarManager.delegatecall(
            abi.encodeWithSignature("writeNotSpecialVar()")
        );
    }
}
contract SpecialVarManager {
    uint256 verySpecialVar;
    function writeSpecialVar() external {
        verySpecialVar = 100;
    }
}
contract NotSpecialVarManager {
    uint256 notSoSpecialVar;
    function writeNotSpecialVar() external {
        notSoSpecialVar = 50;
    }
}