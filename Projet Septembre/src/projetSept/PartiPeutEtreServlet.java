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
 * Servlet implementation class PartiPeutEtreServlet
 */
@WebServlet("/PartiPeutEtreServlet")
public class PartiPeutEtreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartiPeutEtreServlet() {
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
			String psw = "ioplop88";

			Connection cn = (Connection) DriverManager.getConnection(url, user, psw);

			PreparedStatement ps = (PreparedStatement) cn.prepareStatement("INSERT INTO participant (id_evenement, mail_participant, presence) values (?, ?, ?)");
			
			
			ps.setInt(1, idEvent);
			ps.setString(2, login);
			ps.setString(3, "peut-être");
			
			ps.executeUpdate();
			

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		request.getRequestDispatcher("/eventDetailPeutEtre.jsp").forward(request, response);
		
		System.out.println(idEvent);
		System.out.println(login);
		
	}

}