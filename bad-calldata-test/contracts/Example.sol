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
}
