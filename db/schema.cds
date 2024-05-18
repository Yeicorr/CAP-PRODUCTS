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

// entity car {
//     ID         : UUID;
//     name       : String;
//     virtual discount_1 : Decimal;
//     @Core.Computed : false
//     virtual discount_2 : Decimal;
// }

// entity SelProducts  as select from Products;

// entity SelProducts1 as
//     select from Products {
//         *
//     };

// entity SelProducts2 as
//     select from Products {
//         Name,
//         Price,
//         Quantity
//     };

// entity SelProducts3 as
//     select from Products
//     left join ProductReview
//         on Products.Name = ProductReview.Name
//     {
//         Rating,
//         Products.Name,
//         sum(Price) as TotalPrice
//     }
//     group by
//         Rating,
//         Products.Name
//     order by
//         Rating;

// entity ProjProducts  as projection on Products;

// entity ProjProducts2 as
//     projection on Products {
//         *
//     };

// entity ProjProducts3 as
//     projection on Products {
//         ReleaseDate,
//         Name
//     };

// entity ParamProducts(pName : String)     as
//     select from Products {
//         Name,
//         Price,
//         Quantity
//     }
//     where
//         Name = :pName;

// entity ProjParamProducts(pName : String) as projection on Products
//                                             where
//                                                 Name = :pName;

// entity Products {
//     key ID                : Integer;
//         Name              : String not null;
//         Description       : String;
//         ImageUrl          : String;
//         ReleaseDate       : DateTime default $now;
//         DiscontinuedDate  : DateTime;
//         Price             : Decimal(16, 2);
//         Height            : type of Price; //Decimal(16, 2);
//         Width             : Decimal(16, 2);
//         Depth             : Decimal(16, 2);
//         Quantity          : Decimal(16, 2);
//         Supplier_Id       : UUID;
//         ToSupplier        : Association to one Suppliers
//                                 on ToSupplier.Id = Supplier_Id;
//         UnitOfMeasures_Id : String(2);
//         ToUnitOfMeasures  : Association to UnitOfMeasures
//                                 on ToUnitOfMeasures.Id = UnitOfMeasures_Id;
//         DimensionUnits_Id : String(2);
//         ToDimensionUnits  : Association to DimensionUnits
//                                 on ToDimensionUnits.Id = DimensionUnits_Id
// };
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
        Supplier         : Association to one Suppliers;
        UnitOfMeasures   : Association to UnitOfMeasures;
        DimensionUnits   : Association to DimensionUnits;
        Currency         : Association to Currencies;
        Category         : Association to Categories;
        SalesData        : Association to many SalesData
                               on SalesData.Product = $self;
        Reviews          : Association to many ProductReview
                               on Reviews.Product = $self;
};

extend Products with {
    PriceCondition     : String(2);
    PriceDetermination : String(3);
};

entity Suppliers {
    key Id      : UUID;
        Name    : type of Products : Name; //String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
        Product : Association to many Products
                      on Product.Supplier = $self;
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
    key Id      : UUID;
        Name    : String;
        Rating  : Integer;
        Comment : String;
        Product : Association to one Products;
};

entity SalesData {
    key DeliveryDate  : DateTime;
        Revenue       : Decimal(16, 2);
        Product       : Association to one Products;
        Currency      : Association to one Currencies;
        DeliveryMonth : Association to one Months;
};

entity Course {
    ID      : UUID;
    Student : Association to many StudentCourse
                  on Student.Course = $self;
};

entity Student {
    ID     : UUID;
    Course : Association to many StudentCourse
                 on Course.Student = $self;
};

entity StudentCourse {
    ID      : UUID;
    Student : Association to Student;
    Course  : Association to Course;
};

entity Orders {
    key Id       : UUID;
        Date     : Date;
        Customer : String;
        Item     : Composition of many OrderItems
                       on Item.Order = $self;
}

entity OrderItems {
    key Id       : UUID;
        Order    : Association to Orders;
        Product  : Association to Products;
        Quantity : Integer;
}
