package garage.source_code.controller;

import garage.source_code.GenericDao.generic.dao.ConnectDb;
import garage.source_code.GenericDao.generic.dao.GenericDao;
import garage.source_code.model.Employe;
import garage.source_code.model.Genre;
import garage.source_code.model.NiveauEtude;
import garage.source_code.service.EmployeService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "NewEmployeC", value = "/NewEmployeC")
public class NewEmployeC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("content","new_emp");
        request.setAttribute("nav","employe");
        request.setAttribute("content_title","EmployeService");

        EmployeService  service=new EmployeService();
        try {
            Object[] data=service.getData();
            request.setAttribute("genres",(List<Genre>)data[0]);
            request.setAttribute("niveauEtudes",(List<NiveauEtude>)data[1]);

            RequestDispatcher dispatcher=request.getRequestDispatcher("template/main.jsp");
            dispatcher.forward(request, response);
//        response.sendRedirect("template/main.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nom=request.getParameter("nom");
        String prenom=request.getParameter("prenom");
        String idgenre=request.getParameter("idgenre");
        String idniveauEtude=request.getParameter("idniveauEtude");
        String dateNaissance=request.getParameter("dateNaissance");

        EmployeService service=new EmployeService();
        try {


            service.createEmploye(nom,prenom,idgenre,idniveauEtude,dateNaissance);
            response.sendRedirect("SearchEmployeC");

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
