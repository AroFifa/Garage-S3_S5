<%@ page import="garage.source_code.model.Specialite" %>
<%@ page import="java.util.List" %>
<%@ page import="garage.source_code.model.Employe" %>
<%@ page import="garage.source_code.model.Materiel" %>
<%@ page import="garage.source_code.model.Unite" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

    Materiel materiel = (Materiel) request.getAttribute("materiel");

%>


        <div class="card shadow">
            <div class="card-header d-flex flex-wrap justify-content-center align-items-center justify-content-sm-between gap-3">
            </div>
            <div class="card-body">


                <div class="tab-content">
                    <ul class="list-group">
                        <li class="list-group-item"><strong>Produit: </strong><%=materiel.getNom()%>
                        </li>
                        <li class="list-group-item"><strong>Prix d'achat: </strong><%= materiel.getPrixunitaire()%>
                        </li>
                        <li class="list-group-item"><strong>Bénéfice: </strong><%=materiel.getBenefice()%>
                        </li>
                        <li class="list-group-item"><strong>Prix de vente conseillé: </strong><%=materiel.getPrixconseille()%>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

