using {com.logali as logali} from '../db/schema';
using {com.training as training} from '../db/training';

// service CatalogService {

//     entity Products       as projection on logali.materials.Products;
//     entity Suppliers      as projection on logali.sales.Suppliers;
//     entity UnitOfMeasures as projection on logali.materials.UnitOfMeasures;
//     entity DimensionUnits as projection on logali.materials.DimensionUnits;
//     entity Currencies     as projection on logali.materials.Currencies;
//     entity Categories     as projection on logali.materials.Categories;
//     entity Months         as projection on logali.sales.Months;
//     entity SalesData      as projection on logali.sales.SalesData;
//     entity ProductReview  as projection on logali.materials.ProductReview;
//     entity Order          as projection on logali.sales.Orders;
//     entity OrderItem      as projection on logali.sales.OrderItems;
// }

define service CatalogService {

    entity Products          as
        select from logali.materials.Products {
            ID,
            Name           as ProductName     @mandatory,
            Description                       @mandatory,
            ImageUrl,
            ReleaseDate,
            DiscontinuedDate,
            Price                             @mandatory,
            Height,
            Width,
            Depth,
            Quantity                          @mandatory @assert.range,
            UnitOfMeasures as ToUnitOfMeasure @mandatory,
            Currency       as ToCurrency      @mandatory,
            Currency.Id    as CurrencyId,
            Category       as ToCategory      @mandatory,
            Category.Id    as CategoryId,
            Category.Name  as Category        @readonly,
            DimensionUnits as ToDimensionUnit,
            SalesDate,
            Supplier,
            Reviews
        };

    entity Supplier          as
        select from logali.sales.Suppliers {
            ID,
            Name,
            Email,
            Phone,
            Fax,
            Product as ToProduct
        };

    @readonly
    entity Reviews           as
        select from logali.materials.ProductReview {
            ID,
            Name,
            Rating,
            Comment,
            createdAt,
            Product
        };

    @readonly
    entity SalesData         as
        select from logali.sales.SalesData {
            ID,
            DeliveryDate,
            Revenue,
            Currency.Id               as CurrencyKey,
            DeliveryMonth.Id          as DeliveryMonthId,
            DeliveryMonth.Description as DeliveryMonth,
            Product                   as ToProduct
        };

    @readonly
    entity StockAvailability as
        select from logali.materials.StockAvailability {
            Id,
            Description,
            Product as ToProduct
        };

    @readonly
    entity VH_Categories     as
        select from logali.materials.Categories {
            Id   as Code,
            Name as Text
        };

    @readonly
    entity VH_Currencies     as
        select from logali.materials.Currencies {
            Id          as Code,
            Description as Text
        };

    @readonly
    entity VH_UnitOfMeasure  as
        select from logali.materials.UnitOfMeasures {
            Id          as Code,
            Description as Text
        };

    @readonly
    entity VH_DimensionUnits as
        select from logali.materials.DimensionUnits {
            Id          as Code,
            Description as Text
        };

}
