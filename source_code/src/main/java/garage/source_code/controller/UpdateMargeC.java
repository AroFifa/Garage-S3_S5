package garage.source_code.controller;

import garage.source_code.service.EmployeService;
import garage.source_code.service.ServiceService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateMargeC", value = "/UpdateMargeC")
public class UpdateMargeC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content", "marge_service");
        request.setAttribute("nav", "service");
        request.setAttribute("content_title", "Service");

        ServiceService service = new ServiceService();
        try {


            request.setAttribute("services", service.findAllService());

            RequestDispatcher dispatcher = request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
//        response.sendRedirect("template/main.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String marge = request.getParameter("marge");
        String idservice = request.getParameter("idservice");

        ServiceService service=new ServiceService();
        try {
            service.updateMarge(idservice,marge);
            response.sendRedirect("UpdateMargeC");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
