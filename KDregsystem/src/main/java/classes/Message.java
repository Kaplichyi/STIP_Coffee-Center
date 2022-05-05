package classes;

public class Message {
    Integer Id;
    String Username, Message;
    public Message(Integer Id, String Username, String Message){
        this.Id = Id;
        this.Username = Username;
        this.Message = Message;
    }
    public Integer getId() { return Id;}
    public String getUsername() { return Username;}
    public String getMessage() { return Message;}
}
