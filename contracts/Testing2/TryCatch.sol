// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract TryCatch {

    //For Final Catch
    // error NotAllowedError(string);

    function test() public pure {
        //Can Catch With Error
        // require(false, "You're wrong...");

        //Catch for Panic
        assert(false);

        //For Final Catch
        // revert NotAllowedError("You are not allowed...");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint errorCode);
    event ErrorLogBytes(bytes lowLevelData);
    TryCatch fun = new TryCatch();

    function callTest() public {
        try fun.test() {
            // Success
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
            emit ErrorLogCode(errorCode);
        } catch(bytes memory lowLevelData) {
            emit ErrorLogBytes(lowLevelData);
        }
    }
}