using com.training as training from '../db/training';

service ManageOrders{
    entity Orders as projection on training.Orders;
    function getClientTxRate( ClientEmail : String(65) ) returns Decimal(4,2);
}