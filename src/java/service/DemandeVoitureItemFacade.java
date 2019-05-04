/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Carburant;
import bean.DemandeService;
import bean.DemandeVoiture;
import bean.DemandeVoitureItem;
import bean.VoitureModele;
import bean.Worker;
import controller.util.DateUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Ashen One
 */
@Stateless
public class DemandeVoitureItemFacade extends AbstractFacade<DemandeVoitureItem> {
    
    @PersistenceContext(unitName = "bricolagePU")
    private EntityManager em;
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
    public DemandeVoitureItemFacade() {
        super(DemandeVoitureItem.class);
    }
    
    public void saveDemandeVoitureItem(DemandeVoiture demandeVoiture, List<DemandeVoitureItem> demandeVoitureItems) {
        for (DemandeVoitureItem demandeVoitureItem : demandeVoitureItems) {
            demandeVoitureItem.setId(generateId("DemandeVoitureItem", "id"));
            demandeVoitureItem.setDemandeVoiture(demandeVoiture);
            create(demandeVoitureItem);
        }
        
    }
    
    public List<DemandeVoitureItem> findByDemandeVoiture(DemandeVoiture demandeVoiture) {
        
        String requette = "select dvi from DemandeVoitureItem dvi where dvi.demandeVoiture.id = '" + demandeVoiture.getId() + "'";
        System.out.println("requette : " + requette);
        List<DemandeVoitureItem> result = em.createQuery(requette).getResultList();
        if (result.isEmpty()) {
            return new ArrayList<>();
        } else {
            return result;
        }
        
    }
    
    public List<DemandeVoitureItem> findByDemandeVoiture(DemandeVoiture demandeVoiture, Worker worker) {
        
        String requette = "select dvi from DemandeVoitureItem dvi where dvi.demandeVoiture.id = '" + demandeVoiture.getId() + "' AND dvi.worker.login='" + worker.getLogin() + "'";
        System.out.println("requette : " + requette);
        List<DemandeVoitureItem> result = em.createQuery(requette).getResultList();
        if (result.isEmpty()) {
            return new ArrayList<>();
        } else {
            return result;
        }
        
    }
    
    public List<DemandeVoitureItem> rechercher(VoitureModele modeleRecherche, Carburant carburantRecherche, Worker employeRecherche, Date dateDebutMin, Date dateDebutMax, Date dateFinMin, Date dateFinMax) {
        
        String requette = "select dvi from DemandeVoitureItem dvi where 1=1";
        
        if (modeleRecherche != null && modeleRecherche.getId() != null) {
            requette += " and dvi.modele.id = '" + modeleRecherche.getId() + "'";
        }
        if (carburantRecherche != null && carburantRecherche.getId() != null) {
            requette += " and dvi.carburant.id = '" + carburantRecherche.getId() + "'";
        }
        if (employeRecherche != null && employeRecherche.getLogin() != null) {
            requette += " and dvi.worker.login = '" + employeRecherche.getLogin() + "'";
        }
        if (dateDebutMin != null) {
            requette += " and dvi.dateDebut >= '" + DateUtil.getSqlDateTime(dateDebutMin) + "'";
        }
        if (dateFinMin != null) {
            requette += " and dvi.dateFin >= '" + DateUtil.getSqlDateTime(dateFinMin) + "'";
        }
        if (dateDebutMax != null) {
            requette += " and dvi.dateDebut <= '" + DateUtil.getSqlDateTime(dateDebutMax) + "'";
        }
        if (dateFinMax != null) {
            requette += " and dvi.dateFin <= '" + DateUtil.getSqlDateTime(dateFinMax) + "'";
        }
        
        return em.createQuery(requette).getResultList();
        
    }
    
    public DemandeVoitureItem clone(DemandeVoitureItem myDemandeVoitureItem) {
        
        DemandeVoitureItem item = new DemandeVoitureItem();
        item.setCarburant(myDemandeVoitureItem.getCarburant());
        item.setModele(myDemandeVoitureItem.getModele());
        item.setDateDebut(myDemandeVoitureItem.getDateDebut());
        item.setDateFin(myDemandeVoitureItem.getDateFin());
        item.setQuantite(myDemandeVoitureItem.getQuantite());
        item.setNbrJour(DateUtil.diff(item.getDateDebut(), item.getDateFin()));
        item.setWorker(myDemandeVoitureItem.getWorker());
        item.setPrixUnitaire(myDemandeVoitureItem.getPrixUnitaire());
        item.setPrix(item.getPrixUnitaire().multiply(new BigDecimal(item.getQuantite() * item.getNbrJour())));
        
        return item;
    }
    
    public void calculerPrix(DemandeService demandeService, List<DemandeVoitureItem> demandeVoitureItems) {
        BigDecimal total = BigDecimal.ZERO;
        for (DemandeVoitureItem myDemandeVoitureItem : demandeVoitureItems) {
            total = total.add(myDemandeVoitureItem.getPrix());
        }
        demandeService.setPrixHt(total);
        demandeService.setPrixTtc(total);
        
    }
    
    public void addDemandeVoitureItem(DemandeVoiture demandeVoiture, DemandeService demandeService, DemandeVoitureItem demandeVoitureItem, List<DemandeVoitureItem> demandeVoitureItems) {
        
        DemandeVoitureItem item = clone(demandeVoitureItem);
        System.out.println("item = " + item);
        demandeVoitureItems.add(item);
        calculerPrix(demandeService, demandeVoitureItems);
        
    }
    
}
