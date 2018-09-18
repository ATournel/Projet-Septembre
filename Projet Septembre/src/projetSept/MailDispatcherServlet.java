package projetSept;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MailDispatcherServlet")
public class MailDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest request;

	public MailDispatcherServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	String toEmail = request.getParameter("email");
	String subject = request.getParameter("subject");
	String message = request.getParameter("message");

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		String fromEmail = "blabla@gmail.com"; // METTRE L'ADRESSE SUR LAQUELLE LA REPONSE ARRIVERA
		String username = "blabla"; // METTRE LE USERNAME DU SUPERADMIN
		String password = "blabla"; // METTRE LE PASSWORD DU SUPERADMIN

		try (PrintWriter out = response.getWriter()) {
			
			out.println("<!Doctype html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Mail Status</title>");
			out.println("</head>");
			out.println("<h1>Mail Status !!!</h1>");
			out.println("<b>Message sent successfully</b>");
			out.println("Click <a href='emailClient.jsp'>Here</a>to go back !!!");
			out.println("</body>");
			out.println("</html>");
			
		}

	}
}
