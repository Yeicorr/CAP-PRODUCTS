namespace com.logali;

entity Products {
    key ID               : Integer;
        Name             : String;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key Id         : UUID;
        Name       : String;
        Street     : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(2);
        Email      : String;
        Phone      : String;
        Fax        : String;
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
