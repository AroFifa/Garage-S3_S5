package garage.source_code.controller;

import garage.source_code.service.EmployeService;
import garage.source_code.service.MaterielService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "MaterielC", value = "/MaterielC")
public class MaterielC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setAttribute("content", "list_materiel");
        request.setAttribute("nav", "materiel");
        request.setAttribute("content_title", "Produits");

        MaterielService service = new MaterielService();
        try {


            request.setAttribute("materiels", service.getAllMateriel());

            RequestDispatcher dispatcher = request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
//        response.sendRedirect("template/main.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
