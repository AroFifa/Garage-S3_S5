package garage.source_code.controller;

import garage.source_code.model.Genre;
import garage.source_code.model.NiveauEtude;
import garage.source_code.service.EmployeService;
import garage.source_code.service.ServiceService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceC", value = "/ServiceC")
public class ServiceC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content", "prix_service");
        request.setAttribute("nav", "service");
        request.setAttribute("content_title", "Service");

        ServiceService service=new ServiceService();

        try {
//            Object[] data = service.getData();
//            request.setAttribute("genres", (List<Genre>) data[0]);
//            request.setAttribute("niveauEtudes", (List<NiveauEtude>) data[1]);


            String ctg = request.getParameter("ctg");

            request.setAttribute("services", service.getAllPrixService(ctg));
            request.setAttribute("ctg_title", service.getCtgTitle(ctg));

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
