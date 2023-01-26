<%@ page import="garage.source_code.model.PrixService" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: aro
  Date: 1/24/23
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    List<PrixService> services = (List<PrixService>) request.getAttribute("services");
    String ctg= (String) request.getAttribute("ctg_title");

%>

<div class="card shadow">
    <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">
        <form action="ServiceC" method="get">
            <div class="input-group input-group-sm w-auto">

                <select class="form-control form-control-sm" name="ctg" >
                    <option value="v_prix_vente">Prix de vente</option>
                    <option value="v_benefice">Bénéfice</option>
                    <option value="v_charge_totale">Prix de revient</option>
                    <option value="v_charge_salariale">Charge Salariale</option>
                    <option value="v_charge_materiel">Charge matériel</option>
                </select>
                <button class="btn btn-outline-primary btn-sm" type="submit">
                    <i class="fa fa-filter"></i>
                </button>
            </div>
        </form>
    </div>
    <div class="card-body">
        <h3><%=ctg%></h3>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Catégorie</th>
                    <th>Déscription</th>
                    <th>Montant</th>
                </tr>
                </thead>
                <tbody>
                <% for (PrixService p : services) { %>
                <tr>
                    <td class="text-truncate" style="max-width: 200px;"><%=p.getService().getCategorieService().getNom() %>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=p.getService().getNom()%>
                    </td>
                    <td class="text-truncate" style="max-width: 200px;"><%=p.getMontant() %>
                    </td>

                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>