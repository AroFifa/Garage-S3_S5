package garage.source_code.controller;

import garage.source_code.model.Employe;
import garage.source_code.model.Specialite;
import garage.source_code.service.SpecialiteEmployeService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailsEmployeC", value = "/DetailsEmployeC")
public class DetailsEmployeC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content", "details_emp");
        request.setAttribute("nav", "employe");
        request.setAttribute("content_title", "Employé");

        SpecialiteEmployeService service = new SpecialiteEmployeService();
        try {

            String idemploye = request.getParameter("idemploye");

            Object[] data = service.getData(idemploye);
            request.setAttribute("specialites", (List<Specialite>) data[1]);
            request.setAttribute("employe", (Employe) data[0]);

            RequestDispatcher dispatcher = request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
//        response.sendRedirect("template/main.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SpecialiteEmployeService service = new SpecialiteEmployeService();

        String idemploye = request.getParameter("idemploye");
        String idservice = request.getParameter("idspecialite");

        try {
            service.addSpecialiteToEmploye(idemploye, idservice);
            response.sendRedirect("DetailsEmployeC?idemploye=" + idemploye);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
