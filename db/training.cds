namespace com.training;

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
