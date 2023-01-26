package garage.source_code.controller;

import garage.source_code.model.Genre;
import garage.source_code.model.NiveauEtude;
import garage.source_code.service.EmployeService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewEmployeC", value = "/NewEmployeC")
public class NewEmployeC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content", "new_emp");
        request.setAttribute("nav", "employe");
        request.setAttribute("content_title", "Employé");

        EmployeService service = new EmployeService();
        try {
            Object[] data = service.getData();
            request.setAttribute("genres", (List<Genre>) data[0]);
            request.setAttribute("niveauEtudes", (List<NiveauEtude>) data[1]);

            RequestDispatcher dispatcher = request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
//        response.sendRedirect("template/main.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String idgenre = request.getParameter("idgenre");
        String idniveauEtude = request.getParameter("idniveauEtude");
        String dateNaissance = request.getParameter("dateNaissance");

        EmployeService service = new EmployeService();
        try {


            service.createEmploye(nom, prenom, idgenre, idniveauEtude, dateNaissance);
            response.sendRedirect("SearchEmployeC");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
