<%@ page import="garage.source_code.model.Specialite" %>
<%@ page import="java.util.List" %>
<%@ page import="garage.source_code.model.Employe" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    List<Specialite> specialites = (List<Specialite>) request.getAttribute("specialites");
    Employe employe = (Employe) request.getAttribute("employe");

%>
<div class="row">
    <div class="col-6">


        <div class="card shadow">
            <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">
                <form>
                    <div class="input-group input-group-sm w-auto">

                        <input class="form-control form-control-sm" type="text">
                        <button class="btn btn-outline-primary btn-sm" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor"
                                 viewBox="0 0 16 16" class="bi bi-search mb-1">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Spécialité</th>
                            <th>Déscription</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>

                        <% for (Specialite s : specialites) { %>
                        <tr>
                            <td class="text-truncate" style="max-width: 200px;"><%=s.getNom()%>
                            </td>
                            <td class="text-truncate" style="max-width: 200px;"><%=s.getDescription() %>
                            </td>
                            <form action="DetailsEmployeC" method="post">
                                <input type="hidden" name="idemploye" value="<%=employe.getId()%>">
                                <input type="hidden" name="idspecialite" value="<%=s.getId()%>">
                                <td class="text-truncate" style="max-width: 200px;">
                                    <button class="btn btn-dark" type="submit">Ajouter</button>
                                </td>
                            </form>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>
    <div class="col-6">


        <div class="tab-content">
            <ul class="list-group">
                <li class="list-group-item"><strong>Matricule: </strong><%=employe.getMatricule()%>
                </li>
                <li class="list-group-item"><strong>Employé: </strong><%=employe.getNom() %> <%=employe.getPrenom()%>
                </li>
                <li class="list-group-item"><strong>Date de naissance: </strong><%= employe.getDatenaissance()%>
                </li>
                <li class="list-group-item"><strong>Genre: </strong><%=employe.getGenre().getNom()%>
                </li>
                <li class="list-group-item"><strong>Niveau d'étude: </strong><%=employe.getNiveauEtude().getNom()%>
                </li>
                <li class="list-group-item"><strong>Spécialités: </strong><%= employe.formatSpecialites()%></li>

            </ul>
        </div>

    </div>
</div>