import java.io.*;

public class WriteObject {
    public static void main(String[] args) throws Exception {
        FileOutputStream fileOut = new FileOutputStream("SESSIONS.ser");
        ObjectOutputStream out = new ObjectOutputStream(fileOut);
        out.writeObject(new Marker());
        out.close();
        fileOut.close();
        System.out.println("Serialized Marker to SESSIONS.ser");
    }
}
