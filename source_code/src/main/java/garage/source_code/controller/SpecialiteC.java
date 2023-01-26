package garage.source_code.controller;

import garage.source_code.service.SpecialiteEmployeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SpecialiteC", value = "/SpecialiteC")
public class SpecialiteC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SpecialiteEmployeService service = new SpecialiteEmployeService();

        String idemploye = request.getParameter("idemploye");
        String nom = request.getParameter("nom");
        String desc = request.getParameter("description");

        try {
            service.createSpecialite(nom, desc);
            response.sendRedirect("DetailsEmployeC?idemploye=" + idemploye);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
