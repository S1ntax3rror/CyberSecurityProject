import java.io.*;

public class ReadSession {
    public static void main(String[] args) {
        try {
            FileInputStream fileIn = new FileInputStream("SESSIONS.ser");
            ObjectInputStream in = new ObjectInputStream(fileIn);
            Object obj = in.readObject(); // Triggers payload
            in.close();
            fileIn.close();
            System.out.println("Deserialization complete: " + obj.getClass());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
