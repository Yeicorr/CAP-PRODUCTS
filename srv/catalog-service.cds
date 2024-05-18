using {com.logali as logali} from '../db/schema';

service CatalogService {

    entity Products       as projection on logali.Products;
    entity Suppliers      as projection on logali.Suppliers;
    entity UnitOfMeasures as projection on logali.UnitOfMeasures;
    entity DimensionUnits as projection on logali.DimensionUnits;
    entity Currencies     as projection on logali.Currencies;
    entity Categories     as projection on logali.Categories;
    entity Months         as projection on logali.Months;
    entity SalesData      as projection on logali.SalesData;
    entity ProductReview  as projection on logali.ProductReview;
    entity Order          as projection on logali.Orders;
    entity OrderItem      as projection on logali.OrderItems;
}
