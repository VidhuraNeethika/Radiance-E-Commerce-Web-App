import com.apx.radiance.util.Encryption;

public class Test {

    public static void main(String[] args) {

        String encrypt = Encryption.encrypt("123");
        System.out.println(encrypt);

    }

}
