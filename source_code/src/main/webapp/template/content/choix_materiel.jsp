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
                <form action="ChoixMaterielC" method="post">
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
                <form action="MaterielC" method="get">
                    <div class="form-group">

                        <select class="form-control form-control-sm" style="margin-bottom: 15px;" placeholder="Produit"
                                name="idmateriel">
                            <% for (Materiel m : materiels) { %>
                            <option value="<%=m.getId() %>"><%=m.getNom() %>
                            </option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-outline-dark btn-sm" type="submit">choisir
                        </button>
                    </div>
                </form>

            </div>
        </div>

