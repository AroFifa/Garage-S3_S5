package garage.source_code.controller;

import garage.source_code.model.Materiel;
import garage.source_code.model.Unite;
import garage.source_code.service.EmployeService;
import garage.source_code.service.MaterielService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MaterielC", value = "/MaterielC")
public class MaterielC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setAttribute("content", "list_materiel");
        request.setAttribute("nav", "materiel");
        request.setAttribute("content_title", "Produits");

        MaterielService service = new MaterielService();
        try {

            String idmateriel = request.getParameter("idmateriel");


            request.setAttribute("materiel", (Materiel)service.getMateriel(idmateriel));

            RequestDispatcher dispatcher = request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prix_achat = request.getParameter("prixunitaire");
        String idunite = request.getParameter("idunite");

        MaterielService service = new MaterielService();
        try {


            service.createMateriel(nom, prix_achat, idunite);
            response.sendRedirect("MaterielC");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
