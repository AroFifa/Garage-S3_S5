<%@ page import="garage.source_code.model.PrixService" %>
<%@ page import="java.util.List" %>
<%@ page import="garage.source_code.model.Service" %><%--
  Created by IntelliJ IDEA.
  User: aro
  Date: 1/24/23
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<Service> services = (List<Service>) request.getAttribute("services");

%>

<div class="card shadow">
    <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">

    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Catégorie</th>
                    <th>Déscription</th>
                    <th>Marge (%)</th>
                </tr>
                </thead>
                <tbody>
                <% for (Service s : services) { %>
                <tr>
                    <td class="text-truncate" style="max-width: 200px;"><%=s.getCategorieService().getNom() %>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=s.getNom()%>
                    </td>
                    <td class="text-bg-light" style="max-width: 200px;">
                        <% if(s.getMargeBeneficiaire().getMarge()!=null) {%>
                        <form action="UpdateMargeC" method="post">
                            <div class="input-group input-group-sm w-auto">
                                <input type="number" min="1" max="100" placeholder="%" value="<%=s.getMargeBeneficiaire().getMarge()   %>" class="form-control" name="marge" >
                                <input type="hidden" name="idservice" value="<%=s.getId()%>">

                                <button class="btn btn-outline-dark"><i class="fa fa-edit"></i></button>
                            </div>
                        </form>
                        <%  } %>

                    </td>

                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>