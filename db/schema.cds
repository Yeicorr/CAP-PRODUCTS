namespace com.logali;

define type Name : String(50);

type Address     : {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(2);
};

// type Gender      : String enum {
//     male;
//     female;
// };

// entity order {
//     ClientGender : Gender;
//     Status       : Integer enum {
//         submitted = 1;
//         fulfiller = 2;
//         shipped   = 3;
//         cancel    = -1;
//     };
//     Priority     : String enum {
//         high;
//         medium;
//         low;
//     }
// }

// type EmailsAddresses_01 : array of {
//     Kind   : String;
//     emamil : String;
// };

// type EmailsAddresses_02 : {
//     Kind   : String;
//     emamil : String;
// };

// entity Emails   {
//     email01    :      EmailsAddresses_01;
//     email02    : many EmailsAddresses_02;
//     email03    : many {
//         Kind   :      String;
//         emamil :      String;
//     }
// };

entity car {
    ID         : UUID;
    name       : String;
    virtual discount_1 : Decimal;
    @Core.Computed : false 
    virtual discount_2 : Decimal;
}

entity Products {
    key ID               : Integer;
        Name             : String not null;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key Id      : UUID;
        Name    : type of Products : Name; //String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
};

entity Categories {
    key Id   : String(1);
        Name : String;
};

entity StockAvailability {
    key Id          : Integer;
        Description : String;
};

entity Currencies {
    key Id          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key Id          : String(2);
        Description : String;
};

entity DimensionUnits {
    key Id          : String(2);
        Description : String;
};

entity Months {
    key Id               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData {
    key DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
};
