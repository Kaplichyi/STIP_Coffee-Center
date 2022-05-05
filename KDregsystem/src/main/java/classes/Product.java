package classes;

public class Product{
    Integer Id, Price;
    String Name, Description;
    public Product(Integer Id, String Name, Integer Price, String Description){
        this.Id = Id;
        this.Name = Name;
        this.Price = Price;
        this.Description = Description;
    }
    public Integer getId() { return Id;}
    public String getName() { return Name;}
    public Integer getPrice() { return Price;}
    public String getDescription() { return Description;}
}
