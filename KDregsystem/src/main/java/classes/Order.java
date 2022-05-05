package classes;

public class Order {
    String Id, Product_Id, Amount, Customer_ID, Customer_Name, Order_Date;
    public Order(String Id, String Product_Id, String Amount, String Customer_ID, String Customer_Name, String Order_Date){
        this.Id = Id;
        this.Product_Id = Product_Id;
        this.Amount = Amount;
        this.Customer_ID = Customer_ID;
        this.Customer_Name = Customer_Name;
        this.Order_Date = Order_Date;
    }
    public String getId() { return Id;}
    public String getProduct_Id() { return Product_Id;}
    public String getAmount() { return Amount;}
    public String getCustomer_ID() { return Customer_ID;}
    public String getCustomer_Name() { return Customer_Name;}
    public String getOrder_Date() { return Order_Date;}
}
