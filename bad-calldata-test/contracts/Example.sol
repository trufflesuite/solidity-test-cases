contract Example {

    function calldataCorruptionTest(uint[] calldata data) external returns (bool) {
        bool retval;
        {
            uint something = 3;
            retval = true;
        }
        return retval;
    }

    function memoryCorruptionTest(uint[] memory data) public returns (bool) {
        bool retval;
        {
            uint something = 3;
            retval = true;
        }
        return retval;
    }

    function stackCorruptionTest(uint data) public returns (bool) {
        bool retval;
        {
            uint something = 3;
            retval = true;
        }
        return retval;
    }

    function ifTest(uint[] calldata data) external returns (bool) {
        bool retval;
        if (!retval) {
            uint something = 3;
            retval = true;
        }
        return retval;
    }

    function whileTest(uint[] calldata data) external returns (bool) {
        bool retval;
        while (!retval) {
            uint something = 3;
            retval = true;
        }
        return retval;
    }

    function doTest(uint[] calldata data) external returns (bool) {
        bool retval;
        do {
            uint something = 3;
            retval = true;
        } while (!retval);
        return retval;
    }

    function nestTest(uint[] calldata data) external returns (bool) {
        bool retval;
        if (!retval) {
            {
                uint something = 3;
                retval = true;
            }
        }
        return retval;
    }

    function bareNestTest(uint[] calldata data) external returns (bool) {
        bool retval;
        {
            {
                uint something = 3;
                retval = true;
            }
        }
        return retval;
    }

    function assemblyTest(uint[] calldata data) external returns (bool) {
        bool retval;
        assembly {
            let something := 3
            retval := true
        }
        return retval;
    }

    function assemblyBlockTest(uint[] calldata data) external returns (bool) {
        bool retval;
        assembly {
            {
                let something := 3
                retval := true
            }
        }
        return retval;
    }

    function assemblyIfTest(uint[] calldata data) external returns (bool) {
        bool retval;
        assembly {
            if iszero(retval) {
                let something := 3
                retval := true
            }
        }
        return retval;
    }

    function assemblyFnTest(uint[] calldata data) external returns (bool) {
        assembly {
            function assemblyFn(offset, length) -> retval {
                {
                    let something := 3
                    retval := true
                }
                retval := true
            }
            let returned := assemblyFn(data.offset, data.length)
            let freelocation := mload(0x40)
            mstore(freelocation, returned)
            return(freelocation, 0x20)
        }
    }
}
