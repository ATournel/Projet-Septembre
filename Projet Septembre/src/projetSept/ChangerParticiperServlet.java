package projetSept;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class ChangerParticiperServlet
 */
@WebServlet("/ChangerParticiperServlet")
public class ChangerParticiperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangerParticiperServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idEvent = Integer.parseInt(request.getParameter("eventId"));
		String login = request.getParameter("partiId");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mayagenda?useSSL=false";
			String user = "root";
			String psw = "Ioplop88";

			Connection cn = (Connection) DriverManager.getConnection(url, user, psw);

			PreparedStatement ps = (PreparedStatement) cn
					.prepareStatement("UPDATE participant SET presence='participe' WHERE mail_participant='" + login
							+ "' AND id_evenement=" + idEvent + "");

			ps.executeUpdate();

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		request.getRequestDispatcher("/eventDetailOk.jsp").forward(request, response);

		System.out.println(idEvent);
		System.out.println(login);

	}

}