<%@ page import="garage.source_code.model.Specialite" %>
<%@ page import="java.util.List" %>
<%@ page import="garage.source_code.model.Employe" %>
<%@ page import="garage.source_code.model.Materiel" %>
<%@ page import="garage.source_code.model.Unite" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    List<Materiel> materiels = (List<Materiel>) request.getAttribute("materiels");
    List<Unite> unites = (List<Unite>) request.getAttribute("unites");

%>


        <div class="card shadow">
            <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">
                <form action="MaterielC" method="post">
                    <div class="input-group input-group-sm w-auto">

                        <input class="form-control form-control-sm" name="nom" type="text" placeholder="Produit">
                        <input class="form-control form-control-sm" name="prixunitaire" placeholder="Prix d'achat" type="number" min="0">

                        <select class="form-control form-control-sm" style="margin-bottom: 15px;" placeholder="Unités"
                                name="idunite">
                            <% for (Unite u : unites) { %>
                            <option value="<%=u.getId() %>"><%=u.getNom() %>
                            </option>
                            <% } %>
                        </select>
                        <button class="btn btn-outline-dark btn-sm" type="submit">

                            <i class="fas fa-plus-circle "></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>Produit</th>
                            <th>Prix d'achat</th>
                            <th>Bénéfice</th>
                            <th>Prix conseillé</th>
                        </tr>
                        </thead>
                        <tbody>

                        <% for (Materiel m : materiels) { %>
                        <tr>
                            <td class="text-truncate" style="max-width: 200px;"><%=m.getNom()%>
                            </td>
                            <td class="text-truncate" style="max-width: 200px;"><%=m.getPrixunitaire() %>
                            </td>
                            <td class="text-truncate" style="max-width: 200px;">
                                <%=m.getBenefice() %>
                            </td>

                            <td class="text-truncate" style="max-width: 200px;"><%=m.getPrixconseille() %>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

