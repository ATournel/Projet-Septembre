package projetSept;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/MailDispatcherServlet")
public class MailDispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static final String CHEMIN_FICHIERS = "/Desktop/TESTFORMULAIRE";

	public MailDispatcherServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/emailClient.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String expediteur = request.getParameter("expediteur");
		request.setAttribute("expediteur", expediteur);
		
		String sujet = request.getParameter("sujet");
		request.setAttribute("sujet", sujet);
		
		String message = request.getParameter("message");
		request.setAttribute("message", message);
		
		
		try (PrintWriter out = response.getWriter()) {

			out.println("<!Doctype html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Mail Status</title>");
			out.println("</head>");
			out.println("<h1>Mail Status</h1>");
			out.println("<b>Votre message a été envoyé</b>");
			out.println("Cliquer <a href='emailClient.jsp'>ici</a>pour renvoyer un mail");
			out.println("</body>");
			out.println("</html>");
			
		}
		this.getServletContext().getRequestDispatcher("/emailClient.jsp").forward(request, response);
	}
}
