pragma solidity ^0.5.0;

contract UserContract {
  struct UserStruct {
    uint val;
  }

  enum UserEnum {
    it
  }
}

interface UserInterface {
}

library UserLibrary {
}

contract Underscore_Contract {
  struct Underscore_Struct {
    uint val;
  }

  enum Underscore_Enum {
    it
  }

  Underscore_Struct theStruct;
  Underscore_Enum theEnum;
  Underscore_Contract theContract;
  Underscore_Interface theInterface;
  Underscore_Library theLibrary;
}

interface Underscore_Interface {
}

library Underscore_Library {
}

contract Dollar$Contract {
  struct Dollar$Struct {
    uint val;
  }

  enum Dollar$Enum {
    it
  }

  Dollar$Struct theStruct;
  Dollar$Enum theEnum;
  Dollar$Contract theContract;
  Dollar$Interface theInterface;
  Dollar$Library theLibrary;
}

interface Dollar$Interface {
}

library Dollar$Library {
}
