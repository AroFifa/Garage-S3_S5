<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="garage.source_code.model.Genre" %>
<%@ page import="garage.source_code.model.NiveauEtude" %>
<%
    List<Genre> genres=(List<Genre>)request.getAttribute("genres");
    List<NiveauEtude> niveauEtudes=(List<NiveauEtude>)request.getAttribute("niveauEtudes");

%>
<form style="width: 549px;margin-left: 50px;" action="NewEmployeC" method="post">
    <div class="col-md-8" style="width: 512px;padding-right: -1px;padding-left: 0px;">
        <h1 style="font-size: 20px;"><i class="icon-user" style="margin-right: 8px;color: #595959;"></i>Nouveau employé</h1>
        <hr>
        <div class="form-group mb-3">
            <input class="border rounded-0 form-control" type="text" name="nom" style="margin-bottom: 15px;" placeholder="nom">
            <input class="border rounded-0 form-control" type="text" name="prenom" style="margin-bottom: 15px;" placeholder="prénom">
            <select  class="border rounded-0 form-control" style="margin-bottom: 15px;" placeholder= "genre" name="idgenre">
                <% for(Genre g:genres) { %>
                <option value="<%=g.getId() %>"><%=g.getNom() %></option>
                <% } %>
            </select>
            <input class="border rounded-0 form-control" type="date" name="dateNaissance" placeholder="Date de naissance" style="margin-bottom: 15px;">
            <select  class="border rounded-0 form-control" style="margin-bottom: 15px;" placeholder= "Niveau d'étude" name="idniveauEtude">
                <% for(NiveauEtude n:niveauEtudes) { %>
                    <option value="<%=n.getId() %>"><%=n.getNom() %></option>
                <% } %>
            </select>

            <input class="border rounded form-control" type="submit" name="save" style="margin-top: 15px;background-color: #313131;color: rgb(255,255,255);" value="Ajouter">
        </div>
    </div>
</form>