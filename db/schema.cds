namespace com.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';

define type Name : String(50);

type Address     : {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(2);
};

context materials {

    entity Products : cuid, managed {
        Name             : localized String not null;
        Description      : localized String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : type of Price; //Decimal(16, 2);
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
        Supplier         : Association to one sales.Suppliers;
        UnitOfMeasures   : Association to UnitOfMeasures;
        DimensionUnits   : Association to DimensionUnits;
        Currency         : Association to Currencies;
        Category         : Association to Categories;
        SalesDate        : Association to many sales.SalesData
                               on SalesDate.Product = $self;
        Reviews          : Association to many ProductReview
                               on Reviews.Product = $self;
    };

    extend Products with {
        PriceCondition     : String(2);
        PriceDetermination : String(3);
    };

    entity Categories {
        key Id   : String(1);
            Name : localized String;
    };

    entity StockAvailability {
        key Id          : Integer;
            Description : localized String;
            Product     : Association to one Products;
    };

    entity Currencies {
        key Id          : String(3);
            Description : localized String;
    };

    entity UnitOfMeasures {
        key Id          : String(2);
            Description : localized String;
    };

    entity DimensionUnits {
        key Id          : String(2);
            Description : localized String;
    };

    entity ProductReview : cuid, managed {
        Name    : String;
        Rating  : Integer;
        Comment : String;
        Product : Association to one Products;
    };

    entity SelProducts   as select from Products;
    entity ProjProducts  as projection on Products;

    entity ProjProducts2 as
        projection on Products {
            *
        };

    entity ProjProducts3 as
        projection on Products {
            ReleaseDate,
            Name
        };
};

context sales {

    entity Suppliers : cuid, managed {
        Name    : type of materials.Products : Name; //String;
        Address : Address;
        Email   : String;
        Phone   : String;
        Fax     : String;
        Product : Association to many materials.Products
                      on Product.Supplier = $self;
    };

    entity Months {
        key Id               : String(2);
            Description      : localized String;
            ShortDescription : localized String(3);
    };

    entity SalesData : cuid, managed {
        DeliveryDate  : DateTime;
        Revenue       : Decimal(16, 2);
        Product       : Association to one materials.Products;
        Currency      : Association to one materials.Currencies;
        DeliveryMonth : Association to one Months;
    };

    entity Orders : cuid {
        Date     : Date;
        Customer : String;
        Item     : Composition of many OrderItems
                       on Item.Order = $self;
    }

    entity OrderItems : cuid {
        Order    : Association to Orders;
        Product  : Association to materials.Products;
        Quantity : Integer;
    }

    entity SelProducts1 as
        select from materials.Products {
            *
        };

    entity SelProducts2 as
        select from materials.Products {
            Name,
            Price,
            Quantity
        };

    entity SelProducts3 as
        select from materials.Products
        left join materials.ProductReview
            on Products.Name = ProductReview.Name
        {
            Rating,
            Products.Name,
            sum(Price) as TotalPrice
        }
        group by
            Rating,
            Products.Name
        order by
            Rating;
};
