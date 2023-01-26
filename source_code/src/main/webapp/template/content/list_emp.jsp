<%@ page import="garage.source_code.model.Employe" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<Employe> employes = (List<Employe>) request.getAttribute("employes");

%>

<div class="card shadow">
    <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">
        <form action="SearchEmployeC" method="get">
            <div class="input-group input-group-sm w-auto">

                <input class="form-control form-control-sm" name="pattern" type="text">
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
                    <th>#</th>
                    <th>Employé</th>
                    <th>Age</th>
                    <th>Sexe</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <% for (Employe e : employes) { %>
                <tr>
                    <td class="text-truncate" style="max-width: 200px;"><a href="DetailsEmployeC?idemploye=<%=e.getId()%>"><%=e.getMatricule()%></a>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=e.getNom() %> <%=e.getPrenom()%>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=e.getAge()%>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=e.getGenre().getNom()%>
                    </td>

                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>