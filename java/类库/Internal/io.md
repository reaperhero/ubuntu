java.io包提供了输入输出操作的类和接口。它支持文件操作、网络通信、序列化等。

File类用- 于操作文件和目录，提供了创建、删除、重命名等方法。
FileInputStream和FileOutputStream用于读写字节流。
InputStreamReader和OutputStreamWriter用于读写字符流。
BufferedReader和BufferedWriter提供了缓冲区功能，提高IO性能。

BufferedInputStream 和 BufferedOutputStream这两个类是缓冲流，能够提高读写效率。
```
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class BufferedByteStreamExample {
    public static void main(String[] args) {
        try (FileInputStream fis = new FileInputStream("input.txt");
             BufferedInputStream bis = new BufferedInputStream(fis);
             FileOutputStream fos = new FileOutputStream("output.txt");
             BufferedOutputStream bos = new BufferedOutputStream(fos)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = bis.read(buffer)) != -1) {
                bos.write(buffer, 0, bytesRead);
            }
            System.out.println("文件复制成功");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```

BufferedReader 和 BufferedWriter 这两个类是字符缓冲流，可提高字符读写的效率。

```
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class BufferedCharacterStreamExample {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("input.txt"));
             BufferedWriter bw = new BufferedWriter(new FileWriter("output.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                bw.write(line);
                bw.newLine();
            }
            System.out.println("文件复制成功");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
```