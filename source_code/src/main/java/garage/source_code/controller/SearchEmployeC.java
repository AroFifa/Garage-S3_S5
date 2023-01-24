package garage.source_code.controller;

import garage.source_code.model.Genre;
import garage.source_code.model.NiveauEtude;
import garage.source_code.service.EmployeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchEmployeC", value = "/SearchEmployeC")
public class SearchEmployeC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content","list_emp");
        request.setAttribute("nav","employe");
        request.setAttribute("content_title","EmployeService");

        EmployeService service=new EmployeService();
        try {

            String pattern=request.getParameter("pattern");

            request.setAttribute("employes",service.search(pattern));

            RequestDispatcher dispatcher=request.getRequestDispatcher("template/main.jsp");
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
