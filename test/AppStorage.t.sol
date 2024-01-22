// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PseudoDiamond} from "../src/AppStorage.sol";
import {Facet1} from "../src/AppStorage.sol";
import {Facet2} from "../src/AppStorage.sol";

// forge test --match-path ./test/AppStorage.t.sol -vv
contract AppStorageTest is Test {
    PseudoDiamond public pseudoDiamond;
    Facet1 public facet1;
    Facet2 public facet2;
  
    function setUp() public {
        pseudoDiamond = new PseudoDiamond();    
        facet1 = new Facet1();    
        facet2 = new Facet2(); 
    }

    function test_000() public {
        
        //pseudoDiamond.writeToSharedVar(address(facet1), 999);
        console.log("sharedVar: %s", pseudoDiamond.readSharedVar(address(facet2)));

    }

}
