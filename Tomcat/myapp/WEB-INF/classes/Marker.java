import java.io.*;
public class Marker implements Serializable {
  public Marker() {
    try { new File("/tmp/pwned").createNewFile(); } catch(Exception e){}
  }
}
