import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
/**
 * @author Canary
 * @version 1.0.0
 * @title HelloServlet
 * @description 开项目测试
 * @creat 2024/9/22 下午2:06
 **/
@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}
