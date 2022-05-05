package classes;

public class User{
    String Id, Login, Name, Password, EMail, Role;
    public User(String Id, String Login, String Name, String Password, String EMail, String Role){
        this.Id = Id;
        this.Login = Login;
        this.Name = Name;
        this.Password = Password;
        this.EMail = EMail;
        this.Role = Role;
    }
    public String getId() { return Id;}
    public String getLogin() { return Login;}
    public String getName() { return Name;}
    public String getPassword() { return Password;}
    public String getEMail() { return EMail;}
    public String getRole() { return Role;}
}
